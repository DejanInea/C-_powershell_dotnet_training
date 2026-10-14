# Verify authored C# formatting rules and PowerShell syntax.
[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
. (Join-Path $PSScriptRoot 'Initialize-Training.ps1')
Push-Location $PSScriptRoot
try {
  & dotnet format whitespace .\LearningPack.slnx --no-restore --verify-no-changes
  if ($LASTEXITCODE -ne 0) {
    throw 'C# whitespace differs from .editorconfig. See STYLE.md.'
  }

  $styleArguments = @(
    'format', 'style', '.\LearningPack.slnx', '--no-restore', '--verify-no-changes',
    '--diagnostics', 'IDE0011', 'IDE0022', 'IDE0061', 'IDE1006', '--severity', 'info'
  )
  & dotnet @styleArguments
  if ($LASTEXITCODE -ne 0) {
    throw 'C# braces, method bodies, or naming differ from the configured rules.'
  }

  $sources = Get-ChildItem -LiteralPath CSharp, DotNet10 -Recurse -File -Filter '*.cs' |
    Where-Object FullName -NotMatch '[\\/](bin|obj|output|Official-References)[\\/]'
  foreach ($source in $sources) {
    $lineNumber = 0
    foreach ($line in (Get-Content -LiteralPath $source.FullName)) {
      $lineNumber++
      if ($line.Length -gt 100 -or $line.Contains([string][char]9)) {
        throw "$($source.FullName):$lineNumber exceeds 100 columns or contains a tab."
      }
    }
  }

  $scripts = @(
    Get-ChildItem -LiteralPath . -File -Filter '*.ps1'
    Get-ChildItem -LiteralPath PowerShell -Recurse -File |
      Where-Object Extension -in @('.ps1', '.psm1')
    Get-ChildItem -LiteralPath DotNet10 -Recurse -File -Filter '*.ps1' |
      Where-Object FullName -NotMatch '[\\/](bin|obj|output)[\\/]'
  )
  foreach ($script in $scripts) {
    $tokens = $null
    $errors = $null
    [Management.Automation.Language.Parser]::ParseFile(
        $script.FullName, [ref]$tokens, [ref]$errors) | Out-Null
    if ($errors.Count -gt 0) {
      throw "PowerShell syntax errors in $($script.FullName): $($errors.Message -join '; ')"
    }
  }
  Write-Host 'Style checks passed: C# formatting, braces, naming, width, and PowerShell syntax.'
} finally {
  Pop-Location
}
