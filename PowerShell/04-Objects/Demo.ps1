[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$session = [pscustomobject]@{
  Topic = 'PowerShell'
  Minutes = 30
  Complete = $false
}
$session.Complete = $true
Write-Output $session
$session | Get-Member | Select-Object -First 6 Name, MemberType
Write-Output "Topic property: $($session.Topic)"
