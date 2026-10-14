[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Initialize-Training.ps1')
Push-Location $PSScriptRoot

function Assert-Equal($Expected, $Actual, [string]$Label) {
  if ($Expected -ne $Actual) {
    throw "$Label expected '$Expected', got '$Actual'."
  }
  Write-Host "PASS: $Label"
}
function Invoke-Dotnet([string[]]$Arguments) {
  & dotnet @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "dotnet failed ($LASTEXITCODE): $($Arguments -join ' ')"
  }
}
function Get-FreePort {
  $listener = New-Object System.Net.Sockets.TcpListener([System.Net.IPAddress]::Loopback, 0)
  $listener.Start()
  try {
    return $listener.LocalEndpoint.Port
  } finally {
    $listener.Stop()
  }
}
function Stop-LessonServer($Server) {
  if ($null -ne $Server -and -not $Server.Process.HasExited) {
    $Server.Process.Kill()
    $Server.Process.WaitForExit()
  }
}
function Start-LessonServer([string]$Lesson, [string]$DataPath) {
  $port = Get-FreePort
  $baseUri = "http://127.0.0.1:$port"
  $name = 'DotNet10.' + $Lesson.Replace('-', '.')
  $dll = Join-Path $PSScriptRoot "DotNet10\$Lesson\bin\Debug\net10.0\$name.dll"
  $suffix = [guid]::NewGuid().ToString('N')
  $outLog = Join-Path $testDirectory "$Lesson-$suffix.stdout.log"
  $errLog = Join-Path $testDirectory "$Lesson-$suffix.stderr.log"
  $arguments = @(('"' + $dll + '"'), '--urls', $baseUri)
  if ($DataPath) {
    $arguments += @('--TrainingDataPath', ('"' + $DataPath + '"'))
  }
  $process = Start-Process -FilePath (Get-Command dotnet).Source -ArgumentList $arguments -WindowStyle Hidden -PassThru -RedirectStandardOutput $outLog -RedirectStandardError $errLog
  $server = [pscustomobject]@{
    Process = $process
    Uri = $baseUri
    OutputLog = $outLog
    ErrorLog = $errLog
  }
  try {
    for ($attempt = 0; $attempt -lt 100; $attempt++) {
      if ($process.HasExited) {
        throw "Server exited. $([System.IO.File]::ReadAllText($errLog))"
      }
      try {
        $response = Invoke-WebRequest -Uri "$baseUri/health" -UseBasicParsing -TimeoutSec 1
        if ([int]$response.StatusCode -eq 200) {
          return $server
        }
      } catch {
      }
      # Validation lesson has no /health; a reachable 404 still means it started.
      if ($Lesson -eq '06-Validation') {
        try {
          Invoke-WebRequest -Uri "$baseUri/no-such-route" -UseBasicParsing -TimeoutSec 1 | Out-Null
        } catch {
          if ($null -ne $_.Exception.Response -and [int]$_.Exception.Response.StatusCode -eq 404) {
            return $server
          }
        }
      }
      Start-Sleep -Milliseconds 100
    }
    throw "Server did not start. See $outLog and $errLog"
  } catch {
    Stop-LessonServer $server
    throw
  }
}
function Request([string]$Uri, [string]$Method = 'Get', [string]$Body = '', [int]$Status = 200) {
  $parameters = @{
    Uri = $Uri
    Method = $Method
    UseBasicParsing = $true
    TimeoutSec = 5
  }
  if ($Body) {
    $parameters.Body = $Body
    $parameters.ContentType = 'application/json'
  }
  try {
    $response = Invoke-WebRequest @parameters
  } catch {
    if ($null -ne $_.Exception.Response -and [int]$_.Exception.Response.StatusCode -eq $Status) {
      Write-Host "PASS: $Method $Uri -> $Status"
      return $null
    }
    throw
  }
  Assert-Equal $Status ([int]$response.StatusCode) "$Method $Uri"
  if ($response.Content) {
    return ($response.Content | ConvertFrom-Json)
  }
  return $null
}

$servers = New-Object 'System.Collections.Generic.List[object]'
$testDirectory = Join-Path $PSScriptRoot ('.artifacts\checks-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $testDirectory -Force | Out-Null
try {
  Invoke-Dotnet @('build', 'LearningPack.slnx', '--nologo', '-m:1', '-nr:false', '-p:UseSharedCompilation=false')
  foreach ($lesson in (Get-ChildItem -LiteralPath .\CSharp -Directory | Where-Object Name -Match '^\d\d-')) {
    Invoke-Dotnet @('run', '--no-build', '--project', $lesson.FullName)
  }
  foreach ($lesson in @('01-Sdk', '03-Configuration', '04-DependencyInjection', '08-Testing')) {
    Invoke-Dotnet @('run', '--no-build', '--project', ".\DotNet10\$lesson")
  }
  Invoke-Dotnet @('run', '--no-build', '--project', '.\DotNet10\02-Library\App')
  Invoke-Dotnet @('run', '--file', '.\DotNet10\01-Sdk\Hello.cs')

  $shell = (Get-Process -Id $PID).Path
  foreach ($demo in (Get-ChildItem -Path .\PowerShell\*\Demo.ps1)) {
    & $shell -NoProfile -ExecutionPolicy Bypass -File $demo.FullName
    if ($LASTEXITCODE -ne 0) {
      throw "PowerShell lesson failed: $($demo.FullName)"
    }
  }
  # Assert the module's data contract, not the terminal formatting.
  Import-Module .\PowerShell\09-Modules\StudyTools.psm1 -Force
  $sample = @(
    [pscustomobject]@{
      Topic = 'C#'
      Minutes = 30
    }
    [pscustomobject]@{
      Topic = 'C#'
      Minutes = 45
    }
  )
  $summary = @($sample | Get-StudySummary)
  Assert-Equal 1 $summary.Count 'module group count'
  Assert-Equal 75 $summary[0].TotalMinutes 'module numeric aggregation'
  Assert-Equal 2 $summary[0].Sessions 'module session count'
  $rejected = $false
  try {
    [pscustomobject]@{
      Topic = 'C#'
      Minutes = -1
    } | Get-StudySummary | Out-Null
  } catch {
    $rejected = $true
  }
  Assert-Equal $true $rejected 'module rejects negative minutes'

  $previewDirectory = Join-Path $PSScriptRoot 'PowerShell\07-Files\output'
  $beforeHash = (Get-FileHash (Join-Path $previewDirectory 'sessions.csv')).Hash
  & .\PowerShell\07-Files\Demo.ps1 -WhatIf
  Assert-Equal $beforeHash (Get-FileHash (Join-Path $previewDirectory 'sessions.csv')).Hash 'WhatIf leaves CSV unchanged'

  $hello = Start-LessonServer '05-MinimalApi' ''
  $servers.Add($hello)
  $result = Request "$($hello.Uri)/hello/Dejan"
  Assert-Equal 'Hello, Dejan!' $result.message 'route parameter'
  Invoke-Dotnet @('run', '--no-build', '--project', '.\DotNet10\07-HttpClient', '--', $hello.Uri)

  $validation = Start-LessonServer '06-Validation' ''
  $servers.Add($validation)
  $result = Request "$($validation.Uri)/sessions" 'Post' '{"topic":"CSharp","minutes":30}' 200
  Assert-Equal 30 $result.minutes 'valid request body'
  Request "$($validation.Uri)/sessions" 'Post' '{"topic":"","minutes":30}' 400 | Out-Null
  Request "$($validation.Uri)/sessions" 'Post' '{"topic":"CSharp","minutes":0}' 400 | Out-Null
  Request "$($validation.Uri)/sessions" 'Post' '{broken' 400 | Out-Null

  $dataPath = Join-Path $testDirectory 'tasks.json'
  $api = Start-LessonServer '10-Capstone' $dataPath
  $servers.Add($api)
  $task = Request "$($api.Uri)/tasks" 'Post' '{"title":"Learn .NET"}' 201
  Assert-Equal $false $task.isComplete 'new task is incomplete'
  Request "$($api.Uri)/tasks" 'Post' '{"title":"   "}' 400 | Out-Null
  Request "$($api.Uri)/tasks/99999" 'Get' '' 404 | Out-Null
  $completed = Request "$($api.Uri)/tasks/$($task.id)/complete" 'Put'
  Assert-Equal $true $completed.isComplete 'task completion'

  & .\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Preview only' -BaseUri $api.Uri -WhatIf
  $tasks = @(Request "$($api.Uri)/tasks")
  Assert-Equal 1 $tasks.Count 'WhatIf sends no POST'
  $clientTask = & .\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Learn C#' -BaseUri $api.Uri
  Assert-Equal 'Learn C#' $clientTask.title 'PowerShell API client'
  Stop-LessonServer $api

  $restarted = Start-LessonServer '10-Capstone' $dataPath
  $servers.Add($restarted)
  $tasks = @(Request "$($restarted.Uri)/tasks")
  Assert-Equal 2 $tasks.Count 'tasks survive restart'
  Assert-Equal $true $tasks[0].isComplete 'completion survives restart'
  Request "$($restarted.Uri)/tasks/$($task.id)" 'Delete' '' 204 | Out-Null
  Request "$($restarted.Uri)/tasks/$($task.id)" 'Delete' '' 404 | Out-Null

  & .\DotNet10\09-Publishing\Publish.ps1
  Write-Host 'All learning-pack checks passed.'
  Write-Host "API logs and isolated test data: $testDirectory"
} finally {
  foreach ($server in $servers) {
    Stop-LessonServer $server
  }
  Pop-Location
}
