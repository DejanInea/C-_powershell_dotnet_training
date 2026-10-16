[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.Net.Http
$root = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent
$runDirectory = Join-Path $root ('.artifacts\qe-run-' + [guid]::NewGuid().ToString('N'))
New-Item -ItemType Directory -Path $runDirectory -ErrorAction Stop | Out-Null
$cases = @(Import-Csv -LiteralPath (Join-Path $PSScriptRoot '..\Worked-Example\Test-Cases.csv'))
$results = New-Object 'System.Collections.Generic.List[object]'
$requests = New-Object 'System.Collections.Generic.List[object]'
$state = @{
  Server = $null
  CreatedId = 0
  BoundaryId = 0
  Completed = $false
  Deleted = $false
  Starts = 0
  ActiveCase = ''
}
$metadata = [ordered]@{
  StartedAtUtc = [DateTime]::UtcNow.ToString('o')
  Target = 'DotNet10/10-Capstone'
  PowerShell = $PSVersionTable.PSVersion.ToString()
  DataPath = (Join-Path $runDirectory 'tasks.json')
  BaseUrl = $null
  SdkVersion = $null
  SourceHashes = @()
}
$utf8 = New-Object Text.UTF8Encoding($false)

function Assert-Equal($Expected, $Actual, [string]$Label) {
  if ($Expected -ne $Actual) {
    throw "$Label expected '$Expected', observed '$Actual'."
  }
}

function Assert-Ready([bool]$Condition, [string]$Reason) {
  if (-not $Condition) {
    $error = New-Object InvalidOperationException($Reason)
    $error.Data['Blocked'] = $true
    throw $error
  }
}

function Send-Request([string]$Method, [string]$Path, [string]$Body) {
  $sentAt = [DateTime]::UtcNow.ToString('o')
  $record = $null
  $transportError = ''
  $parameters = @{
    Uri = $metadata.BaseUrl + $Path
    Method = $Method
    UseBasicParsing = $true
    TimeoutSec = 5
    ErrorAction = 'Stop'
  }
  if ($PSBoundParameters.ContainsKey('Body')) {
    $parameters.ContentType = 'application/json; charset=utf-8'
    $parameters.Body = [Text.Encoding]::UTF8.GetBytes($Body)
  }
  try {
    $response = Invoke-WebRequest @parameters
    $record = [pscustomobject]@{
      StatusCode = [int]$response.StatusCode
      Body = [string]$response.Content
    }
  } catch {
    if ($null -eq $_.Exception.Response) {
      $transportError = $_.Exception.Message
      throw
    }
    $response = $_.Exception.Response
    $bodyText = ''
    if ($response -is [System.Net.Http.HttpResponseMessage]) {
      $bodyText = $response.Content.ReadAsStringAsync().GetAwaiter().GetResult()
    } else {
      $reader = New-Object IO.StreamReader($response.GetResponseStream())
      try { $bodyText = $reader.ReadToEnd() } finally { $reader.Dispose() }
    }
    $record = [pscustomobject]@{
      StatusCode = [int]$response.StatusCode
      Body = $bodyText
    }
  } finally {
    $statusCode = $null
    $responseBody = ''
    if ($null -ne $record) {
      $statusCode = $record.StatusCode
      $responseBody = $record.Body
    }
    $requests.Add([pscustomobject]@{
      CaseId = $state.ActiveCase
      SentAtUtc = $sentAt
      Method = $Method
      Path = $Path
      RequestBody = $Body
      StatusCode = $statusCode
      ResponseBody = $responseBody
      TransportError = $transportError
    })
  }
  return $record
}

function Get-Tasks {
  $response = Send-Request 'Get' '/tasks'
  Assert-Equal 200 $response.StatusCode 'List HTTP status'
  $items = ConvertFrom-Json -InputObject $response.Body
  return ,@($items)
}

function Invoke-Case([string]$CaseId, [scriptblock]$Action) {
  $state.ActiveCase = $CaseId
  $case = $cases | Where-Object CaseId -eq $CaseId
  $timer = [Diagnostics.Stopwatch]::StartNew()
  $status = 'Passed'
  try {
    Assert-Ready ($null -ne $state.Server -and -not $state.Server.HasExited) `
      'Owned server is unavailable; inspect the server logs.'
    $actual = (& $Action) -join '; '
  } catch {
    $status = 'Failed'
    if ($_.Exception.Data.Contains('Blocked')) { $status = 'Blocked' }
    $actual = $_.Exception.Message
  }
  $timer.Stop()
  $results.Add([pscustomobject]@{
    CaseId = $CaseId
    RequirementId = $case.RequirementId
    Title = $case.Title
    Expected = $case.ExpectedResult
    Status = $status
    Actual = $actual
    DurationMs = $timer.ElapsedMilliseconds
    RecordedAtUtc = [DateTime]::UtcNow.ToString('o')
  })
  Write-Host "$status $CaseId - $($case.Title)"
}

function Stop-OwnedServer($Server) {
  if ($null -ne $Server -and -not $Server.HasExited) {
    $Server.Kill()
    [void]$Server.WaitForExit(5000)
  }
}

function Start-OwnedServer {
  $state.Starts++
  $outLog = Join-Path $runDirectory ("server-$($state.Starts).stdout.log")
  $errLog = Join-Path $runDirectory ("server-$($state.Starts).stderr.log")
  $arguments = @(
    ('"' + $dllPath + '"'), '--urls', $metadata.BaseUrl,
    '--TrainingDataPath', ('"' + $metadata.DataPath + '"')
  )
  $server = Start-Process -FilePath (Get-Command dotnet).Source -ArgumentList $arguments `
    -WindowStyle Hidden -PassThru -RedirectStandardOutput $outLog -RedirectStandardError $errLog
  try {
    $timer = [Diagnostics.Stopwatch]::StartNew()
    while ($timer.Elapsed.TotalSeconds -lt 30) {
      if ($server.HasExited) { throw "API exited. Inspect $errLog and $outLog" }
      try {
        $response = Invoke-WebRequest -Uri ($metadata.BaseUrl + '/health') `
          -UseBasicParsing -TimeoutSec 1 -ErrorAction Stop
        if ([int]$response.StatusCode -eq 200) { return $server }
      } catch {
        # Startup can take a moment; only readiness is retried, not test failures.
      }
      Start-Sleep -Milliseconds 100
    }
    throw "API readiness timed out. Inspect $outLog"
  } catch {
    Stop-OwnedServer $server
    throw
  }
}

function Write-Report {
  $records = @($results.ToArray())
  $records | Export-Csv -LiteralPath (Join-Path $runDirectory 'Results.csv') `
    -NoTypeInformation -Encoding UTF8
  [IO.File]::WriteAllText((Join-Path $runDirectory 'Results.json'),
      (ConvertTo-Json -InputObject $records -Depth 6), $utf8)
  [IO.File]::WriteAllText((Join-Path $runDirectory 'Environment.json'),
      (ConvertTo-Json -InputObject $metadata -Depth 6), $utf8)
  [IO.File]::WriteAllText((Join-Path $runDirectory 'Requests.json'),
      (ConvertTo-Json -InputObject @($requests.ToArray()) -Depth 6), $utf8)
  $rows = New-Object Text.StringBuilder
  foreach ($record in $records) {
    [void]$rows.Append('<tr class="' + $record.Status + '">')
    foreach ($value in @($record.CaseId, $record.Title, $record.Status,
        $record.Expected, $record.Actual, $record.DurationMs)) {
      [void]$rows.Append('<td>' + [Net.WebUtility]::HtmlEncode([string]$value) + '</td>')
    }
    [void]$rows.Append('</tr>')
  }
  $passed = @($records | Where-Object Status -eq Passed).Count
  $failed = @($records | Where-Object Status -eq Failed).Count
  $blocked = @($records | Where-Object Status -eq Blocked).Count
  $started = [Net.WebUtility]::HtmlEncode($metadata.StartedAtUtc)
  $html = @"
<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1"><title>QE API results</title>
<style>
body{font:16px/1.5 system-ui,sans-serif;margin:0;background:#f5f8fc;color:#172b43}
main{max-width:1400px;margin:auto;padding:30px}h1{margin-bottom:8px}
.counts{padding:18px;background:white;border-left:5px solid #176b84}
.scroll{overflow:auto}table{width:100%;border-collapse:collapse;background:white}
th,td{text-align:left;vertical-align:top;padding:12px;border:1px solid #d6e0eb}
th{background:#153451;color:white}td:first-child{white-space:nowrap}
.Passed td:nth-child(3){background:#dcfce7}
.Failed td:nth-child(3){background:#fee2e2}.Blocked td:nth-child(3){background:#fef3c7}
a{color:#135f85}code{overflow-wrap:anywhere}@media print{main{padding:0}tr{break-inside:avoid}}
</style></head><body><main><h1>Local task API: observed results</h1>
<p>Run started: $started UTC. Target: DotNet10/10-Capstone.</p>
<p class="counts">Planned: $($cases.Count) | Passed: $passed | Failed: $failed | Blocked: $blocked</p>
<p><a href="Results.csv">CSV results</a> &middot; <a href="Results.json">JSON results</a> &middot; <a href="Requests.json">Request/response evidence</a> &middot; <a href="Environment.json">Environment and source hashes</a></p>
<div class="scroll"><table><thead><tr><th>Case</th><th>Behavior</th><th>Result</th><th>Expected</th><th>Actual evidence</th><th>ms</th></tr></thead><tbody>$rows</tbody></table></div>
<h2>Limits of this evidence</h2><p>These checks cover selected API inputs, state transitions, and a controlled restart. They do not prove crash durability, backup recovery, concurrency correctness, performance, authorization, or browser accessibility. Timings are diagnostic check durations, not benchmark results.</p>
<p>Server logs and isolated task data are retained beside this report. The source workbook remains a reusable planning snapshot.</p>
</main></body></html>
"@
  [IO.File]::WriteAllText((Join-Path $runDirectory 'Report.html'), $html, $utf8)
  Write-Host "Report: $(Join-Path $runDirectory 'Report.html')"
}

try {
  . (Join-Path $root 'Initialize-Training.ps1')
  $metadata.SdkVersion = (& dotnet --version) -join ''
  $projectPath = Join-Path $root 'DotNet10\10-Capstone\DotNet10.10.Capstone.csproj'
  $dllPath = Join-Path $root 'DotNet10\10-Capstone\bin\Debug\net10.0\DotNet10.10.Capstone.dll'
  $metadata.SourceHashes = @(Get-ChildItem (Join-Path $root 'DotNet10\10-Capstone') `
      -File -Filter '*.cs' | Get-FileHash -Algorithm SHA256 | Select-Object Path, Hash)
  & dotnet build $projectPath --nologo -m:1 -nr:false *> (Join-Path $runDirectory 'build.log')
  if ($LASTEXITCODE -ne 0) { throw 'Build failed; inspect build.log.' }
  $listener = New-Object Net.Sockets.TcpListener([Net.IPAddress]::Loopback, 0)
  $listener.Start()
  try { $port = ([Net.IPEndPoint]$listener.LocalEndpoint).Port } finally { $listener.Stop() }
  $metadata.BaseUrl = "http://127.0.0.1:$port"
  $state.Server = Start-OwnedServer

  Invoke-Case 'TC-01' {
    $response = Send-Request 'Get' '/health'
    Assert-Equal 200 $response.StatusCode 'HTTP'
    Assert-Equal 'ok' ($response.Body | ConvertFrom-Json).status 'Health status'
    '200; status=ok'
  }
  Invoke-Case 'TC-02' {
    Assert-Equal 0 (Get-Tasks).Count 'Initial count'
    '200; empty array'
  }
  Invoke-Case 'TC-03' {
    $response = Send-Request 'Post' '/tasks' '{"title":"  QE task  "}'
    Assert-Equal 201 $response.StatusCode 'HTTP'
    $task = $response.Body | ConvertFrom-Json
    Assert-Equal $true ($task.id -is [int] -or $task.id -is [long]) 'Integer ID type'
    Assert-Equal $true ($task.id -gt 0) 'Positive integer ID'
    Assert-Equal 'QE task' $task.title 'Trimmed title'
    Assert-Equal $false $task.isComplete 'Initial state'
    $state.CreatedId = [int]$task.id
    "201; id=$($task.id); title=QE task; incomplete"
  }
  Invoke-Case 'TC-04' {
    Assert-Ready ($state.CreatedId -gt 0) 'Valid creation is a prerequisite.'
    $response = Send-Request 'Post' '/tasks' '{"title":"   "}'
    Assert-Equal 400 $response.StatusCode 'HTTP'
    Assert-Equal 1 (Get-Tasks).Count 'Count after rejection'
    '400; count=1'
  }
  Invoke-Case 'TC-05' {
    Assert-Ready ($state.CreatedId -gt 0) 'Valid creation is a prerequisite.'
    $title = 'a' * 200
    $response = Send-Request 'Post' '/tasks' (ConvertTo-Json @{ title = $title } -Compress)
    Assert-Equal 201 $response.StatusCode 'HTTP'
    $task = $response.Body | ConvertFrom-Json
    Assert-Equal $true ($task.id -is [int] -or $task.id -is [long]) 'Integer ID type'
    Assert-Equal $true ($task.id -gt 0 -and $task.id -ne $state.CreatedId) 'Distinct positive ID'
    Assert-Equal $title $task.title 'Boundary title'
    Assert-Equal 2 (Get-Tasks).Count 'Count'
    $state.BoundaryId = [int]$task.id
    '201; title length=200; count=2'
  }
  Invoke-Case 'TC-06' {
    Assert-Ready ($state.BoundaryId -gt 0) 'Boundary creation is a prerequisite.'
    $response = Send-Request 'Post' '/tasks' (ConvertTo-Json @{ title = ('a' * 201) })
    Assert-Equal 400 $response.StatusCode 'HTTP'
    Assert-Equal 2 (Get-Tasks).Count 'Count after rejection'
    '400; count=2'
  }
  Invoke-Case 'TC-07' {
    Assert-Ready ($state.BoundaryId -gt 0) 'Boundary creation is a prerequisite.'
    $response = Send-Request 'Post' '/tasks' '{ broken'
    Assert-Equal 400 $response.StatusCode 'HTTP'
    Assert-Equal 2 (Get-Tasks).Count 'Count after rejection'
    '400; count=2'
  }
  Invoke-Case 'TC-08' {
    Assert-Ready ($state.BoundaryId -gt 0) 'Boundary creation is a prerequisite.'
    $response = Send-Request 'Get' '/tasks/2147483647'
    Assert-Equal 404 $response.StatusCode 'HTTP'
    Assert-Equal 2 (Get-Tasks).Count 'Count after absent read'
    '404; count=2'
  }
  Invoke-Case 'TC-09' {
    Assert-Ready ($state.CreatedId -gt 0) 'Valid creation is a prerequisite.'
    $response = Send-Request 'Put' "/tasks/$($state.CreatedId)/complete"
    Assert-Equal 200 $response.StatusCode 'HTTP'
    $task = $response.Body | ConvertFrom-Json
    Assert-Equal $state.CreatedId $task.id 'ID'
    Assert-Equal 'QE task' $task.title 'Title'
    Assert-Equal $true $task.isComplete 'Completion'
    $state.Completed = $true
    '200; original ID/title; complete'
  }
  Invoke-Case 'TC-10' {
    Assert-Ready ($state.BoundaryId -gt 0 -and $state.Completed) `
      'A confirmed completed task is a prerequisite.'
    $response = Send-Request 'Put' "/tasks/$($state.CreatedId)/complete"
    Assert-Equal 200 $response.StatusCode 'HTTP'
    $task = $response.Body | ConvertFrom-Json
    Assert-Equal $state.CreatedId $task.id 'Repeated ID'
    Assert-Equal 'QE task' $task.title 'Repeated title'
    Assert-Equal $true $task.isComplete 'Repeated completion'
    Assert-Equal 2 (Get-Tasks).Count 'Count after repeat'
    '200; same completed task; count=2'
  }
  Invoke-Case 'TC-11' {
    Assert-Ready ($state.BoundaryId -gt 0 -and $state.Completed) `
      'Saved tasks and confirmed completion are prerequisites.'
    Stop-OwnedServer $state.Server
    $state.Server = $null
    $state.Server = Start-OwnedServer
    $response = Send-Request 'Get' "/tasks/$($state.CreatedId)"
    Assert-Equal 200 $response.StatusCode 'HTTP after restart'
    $task = $response.Body | ConvertFrom-Json
    Assert-Equal $state.CreatedId $task.id 'Restart ID'
    Assert-Equal 'QE task' $task.title 'Restart title'
    Assert-Equal $true $task.isComplete 'Restart completion'
    Assert-Equal 2 (Get-Tasks).Count 'Restart count'
    'New server process; same file; original ID/title/completion; count=2'
  }
  Invoke-Case 'TC-12' {
    Assert-Ready ($state.BoundaryId -gt 0) 'Saved tasks are prerequisites.'
    $response = Send-Request 'Delete' "/tasks/$($state.CreatedId)"
    Assert-Equal 204 $response.StatusCode 'HTTP'
    $tasks = Get-Tasks
    Assert-Equal 1 $tasks.Count 'Count after delete'
    Assert-Equal $state.BoundaryId $tasks[0].id 'Remaining task'
    $state.Deleted = $true
    '204; only boundary task remains'
  }
  Invoke-Case 'TC-13' {
    Assert-Ready $state.Deleted 'Confirmed deletion is a prerequisite.'
    $response = Send-Request 'Get' "/tasks/$($state.CreatedId)"
    Assert-Equal 404 $response.StatusCode 'HTTP'
    $tasks = Get-Tasks
    Assert-Equal 1 $tasks.Count 'Remaining count'
    Assert-Equal $state.BoundaryId $tasks[0].id 'Remaining task'
    '404; boundary task remains'
  }
  Invoke-Case 'TC-14' {
    Assert-Ready $state.Deleted 'Confirmed deletion is a prerequisite.'
    $response = Send-Request 'Delete' "/tasks/$($state.CreatedId)"
    Assert-Equal 404 $response.StatusCode 'HTTP'
    Assert-Equal 1 (Get-Tasks).Count 'Count after repeated delete'
    '404; count=1'
  }
  Invoke-Case 'TC-15' {
    Assert-Ready ($state.BoundaryId -gt 0 -and $state.Deleted) `
      'Boundary task and confirmed deletion are prerequisites.'
    $response = Send-Request 'Post' '/tasks' '{}'
    Assert-Equal 400 $response.StatusCode 'HTTP'
    Assert-Equal 1 (Get-Tasks).Count 'Count after missing input'
    '400; count=1'
  }
  Invoke-Case 'TC-16' {
    Assert-Ready ($state.BoundaryId -gt 0 -and $state.Deleted) `
      'Boundary task and confirmed deletion are prerequisites.'
    $response = Send-Request 'Post' '/tasks' '{"title":123}'
    Assert-Equal 400 $response.StatusCode 'HTTP'
    Assert-Equal 1 (Get-Tasks).Count 'Count after wrong type'
    '400; count=1'
  }
} catch {
  $setupError = $_.Exception.Message
  Write-Warning $setupError
  foreach ($case in $cases) {
    if (-not @($results | Where-Object CaseId -eq $case.CaseId).Count) {
      $results.Add([pscustomobject]@{
        CaseId = $case.CaseId
        RequirementId = $case.RequirementId
        Title = $case.Title
        Expected = $case.ExpectedResult
        Status = 'Blocked'
        Actual = $setupError
        DurationMs = 0
        RecordedAtUtc = [DateTime]::UtcNow.ToString('o')
      })
    }
  }
} finally {
  Stop-OwnedServer $state.Server
  Write-Report
}
if (@($results | Where-Object Status -ne Passed).Count) { exit 1 }
Write-Host 'All 16 API checks passed. Reports describe this run only.'
exit 0
