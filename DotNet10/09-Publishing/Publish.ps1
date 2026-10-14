[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$project = Join-Path $PSScriptRoot '..\01-Sdk\DotNet10.01.Sdk.csproj'
$destination = Join-Path $PSScriptRoot 'output\published'
& dotnet publish $project -c Release --self-contained false -o $destination -m:1 -nr:false
if ($LASTEXITCODE -ne 0) {
  throw "Publish failed: $LASTEXITCODE"
}
& dotnet (Join-Path $destination 'DotNet10.01.Sdk.dll')
if ($LASTEXITCODE -ne 0) {
  throw "Published app failed: $LASTEXITCODE"
}
