[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sessions = @(
  [pscustomobject]@{
    Topic = 'C#'
    Minutes = 45
  }
  [pscustomobject]@{
    Topic = 'PowerShell'
    Minutes = 20
  }
  [pscustomobject]@{
    Topic = '.NET 10'
    Minutes = 30
  }
)
$sessions | Where-Object {
  $_.Minutes -ge 30
} |
  Sort-Object Minutes -Descending |
  ForEach-Object {
  '{0}: {1} minutes' -f $_.Topic, $_.Minutes
}
$measure = $sessions | Measure-Object -Property Minutes -Sum -Average
Write-Output "Total: $($measure.Sum) minutes"
