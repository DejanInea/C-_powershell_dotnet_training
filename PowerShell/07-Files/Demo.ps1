[CmdletBinding(SupportsShouldProcess)]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$outputDirectory = Join-Path $PSScriptRoot 'output'
if (-not $PSCmdlet.ShouldProcess($outputDirectory, 'Create sample CSV and JSON')) {
  return
}
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null
$csvPath = Join-Path $outputDirectory 'sessions.csv'
$jsonPath = Join-Path $outputDirectory 'sessions.json'
$sessions = @(
  [pscustomobject]@{
    Topic = 'C#'
    Minutes = 30
  }
  [pscustomobject]@{
    Topic = 'PowerShell'
    Minutes = 20
  }
)
$sessions | Export-Csv -LiteralPath $csvPath -NoTypeInformation -Encoding UTF8
$sessions | ConvertTo-Json -Depth 3 | Set-Content -LiteralPath $jsonPath -Encoding UTF8
$loaded = @(Import-Csv -LiteralPath $csvPath)
$total = ($loaded | ForEach-Object {
    [int]$_.Minutes
  } | Measure-Object -Sum).Sum
Write-Output "Rows loaded: $($loaded.Count); total: $total minutes"
