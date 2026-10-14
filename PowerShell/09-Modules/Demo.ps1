[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Import-Module (Join-Path $PSScriptRoot 'StudyTools.psm1') -Force

$sessions = @(
  [pscustomobject]@{
    Topic = 'C#'
    Minutes = 30
  }
  [pscustomobject]@{
    Topic = 'C#'
    Minutes = 45
  }
  [pscustomobject]@{
    Topic = 'PowerShell'
    Minutes = 20
  }
)
$sessions | Get-StudySummary | ForEach-Object {
  '{0}: {1} sessions, {2} minutes' -f $_.Topic, $_.Sessions, $_.TotalMinutes
}
