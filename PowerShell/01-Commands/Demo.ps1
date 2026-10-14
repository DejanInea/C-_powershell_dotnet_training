[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Verb-Noun names describe actions. Inspect before automating.
Get-Command Get-Date | Select-Object Name, CommandType
Get-Date -Format 'yyyy-MM-dd'
Get-Help Get-ChildItem -Examples
Write-Output 'Tip: use Get-Command and Get-Help whenever a command is unfamiliar.'
