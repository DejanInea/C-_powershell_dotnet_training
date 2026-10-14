[CmdletBinding()]
param([ValidateSet('CSharp','PowerShell','DotNet10')][string]$Topic = 'CSharp')
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
function Invoke-Git([string[]]$Arguments) {
  & git @Arguments
  if ($LASTEXITCODE -ne 0) {
    throw "Git failed: $($Arguments -join ' ')"
  }
}
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
  throw 'Install Git for Windows first.'
}
$labRoot = Join-Path $PSScriptRoot ('.artifacts\git-' + $Topic + '-' + [guid]::NewGuid().ToString('N'))
$developer = Join-Path $labRoot 'developer'
$remote = Join-Path $labRoot 'origin.git'
$teammate = Join-Path $labRoot 'teammate'
New-Item -ItemType Directory -Path $developer -Force | Out-Null
Push-Location $developer
try {
  Invoke-Git @('init', '--initial-branch=main')
  Invoke-Git @('config','--local','user.name','Course Lab Learner')
  Invoke-Git @('config','--local','user.email','course-lab@example.invalid')
  foreach ($name in @(
      '.gitignore', '.gitattributes', '.editorconfig', 'Directory.Build.props',
      'NuGet.Config', 'global.json', 'Initialize-Training.ps1')) {
    Copy-Item -LiteralPath (Join-Path $PSScriptRoot $name) -Destination (Join-Path $developer $name)
  }
  $firstLesson = switch ($Topic) {
    'CSharp' {
      '01-Hello'
    }
    'PowerShell' {
      '01-Commands'
    }
    'DotNet10' {
      '01-Sdk'
    }
  }
  $lessonTarget = Join-Path $developer "$Topic\$firstLesson"
  New-Item -ItemType Directory -Path $lessonTarget -Force | Out-Null
  Get-ChildItem -LiteralPath (Join-Path $PSScriptRoot "$Topic\$firstLesson") -File |
    Where-Object Extension -in @('.cs','.csproj','.ps1') |
    ForEach-Object {
    Copy-Item -LiteralPath $_.FullName -Destination $lessonTarget
  }
  [System.IO.File]::WriteAllText((Join-Path $developer 'PracticeNotes.txt'), 'Baseline: learn one concept at a time.' + [Environment]::NewLine)
  Invoke-Git @('add','--','.')
  Invoke-Git @('commit','-m',"chore($($Topic.ToLowerInvariant())): create isolated Git practice")
  Invoke-Git @('init','--bare','--initial-branch=main',$remote)
  Invoke-Git @('remote','add','origin',$remote)
  Invoke-Git @('push','-u','origin','main')
  Invoke-Git @('clone',$remote,$teammate)
  Invoke-Git @('-C',$teammate,'config','--local','user.name','Course Lab Teammate')
  Invoke-Git @('-C',$teammate,'config','--local','user.email','course-teammate@example.invalid')
  Write-Host "Developer folder: $developer"
  Write-Host "Teammate folder:  $teammate"
  Write-Host "Local remote:     $remote"
  Write-Host 'The original course repository was not changed.'
} finally {
  Pop-Location
}
