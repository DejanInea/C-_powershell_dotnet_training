[CmdletBinding()]
param([string]$Name = 'Learner')
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

[int]$minutes = 30
$topics = @('C#', 'PowerShell', '.NET 10')
$plan = @{
  Topic = $topics[1]
  Minutes = $minutes
}
Write-Output "Hello, $Name!"
Write-Output ('Topic: {0}; minutes: {1}' -f $plan.Topic, $plan.Minutes)
Write-Output "Topic count: $($topics.Count)"
Write-Output 'Single quotes keep $minutes as literal text.'
