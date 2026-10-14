[CmdletBinding()]
param([ValidateRange(1, 180)][int]$Minutes = 30)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ($Minutes -ge 30) {
  Write-Output 'Long session'
} else {
  Write-Output 'Short session'
}

$total = 0
foreach ($duration in @(10, 20, $Minutes)) {
  $total += $duration
}
Write-Output "Total: $total minutes"
for ($round = 1; $round -le 3; $round++) {
  Write-Output "Round $round"
}
