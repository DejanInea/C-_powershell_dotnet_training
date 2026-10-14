[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# Dot-source this file to keep these variables in your current terminal.
$env:DOTNET_CLI_HOME = Join-Path $PSScriptRoot '.tools\dotnet-home'
$env:DOTNET_SKIP_FIRST_TIME_EXPERIENCE = '1'
$env:DOTNET_CLI_TELEMETRY_OPTOUT = '1'
$env:DOTNET_NOLOGO = '1'
$env:DOTNET_ADD_GLOBAL_TOOLS_TO_PATH = 'false'
New-Item -ItemType Directory -Path $env:DOTNET_CLI_HOME -Force | Out-Null
if (-not (Get-Command dotnet -ErrorAction SilentlyContinue)) {
  throw 'Install the .NET 10 SDK: https://dotnet.microsoft.com/download/dotnet/10.0'
}
$sdkVersion = & dotnet --version
if ($LASTEXITCODE -ne 0) {
  throw 'The .NET SDK could not start.'
}
if ($sdkVersion -notmatch '^10\.') {
  throw "This course requires a .NET 10 SDK. Found: $sdkVersion"
}
Write-Host "Ready: .NET SDK $sdkVersion; PowerShell $($PSVersionTable.PSVersion)"
Write-Host 'Start: dotnet run --project .\CSharp\01-Hello -- Dejan'
