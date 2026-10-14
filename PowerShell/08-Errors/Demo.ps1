[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

try {
  Get-Content -LiteralPath (Join-Path $PSScriptRoot 'deliberately-missing.txt') -ErrorAction Stop
} catch [System.Management.Automation.ItemNotFoundException] {
  Write-Output 'Expected: the demonstration file does not exist.'
} finally {
  Write-Verbose 'The finally block runs after success or failure.'
}

# Native tools use process exit codes; ErrorActionPreference alone is insufficient in 5.1.
& dotnet --version
if ($LASTEXITCODE -ne 0) {
  throw "dotnet failed with exit code $LASTEXITCODE"
}
Write-Output 'The dotnet command succeeded.'
