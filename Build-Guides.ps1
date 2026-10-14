[CmdletBinding()]
param([string]$BrowserPath)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

function Convert-Inline([string]$Text) {
  $encoded = [System.Net.WebUtility]::HtmlEncode($Text)
  $encoded = [regex]::Replace($encoded, '\x60([^\x60]+)\x60', '<code>$1</code>')
  $encoded = [regex]::Replace($encoded, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
  $encoded = [regex]::Replace($encoded, '\[([^\]]+)\]\(([^)]+)\)', '<a href="$2">$1</a>')
  return [regex]::Replace($encoded, 'href="(?:\.\./)?(\d\d-[^"/]+)/README\.md"', 'href="#$1"')
}
function Convert-Markdown([string]$Markdown) {
  $html = New-Object System.Text.StringBuilder
  $inCode = $false
  $listKind = ''
  $inTable = $false
  foreach ($line in ($Markdown -split '\r?\n')) {
    if ($line -match '^\x60\x60\x60') {
      if ($listKind) {
        [void]$html.AppendLine("</$listKind>")
        $listKind = ''
      }
      if ($inTable) {
        [void]$html.AppendLine('</tbody></table>')
        $inTable = $false
      }
      if ($inCode) {
        [void]$html.AppendLine('</code></pre>')
      } else {
        [void]$html.AppendLine('<pre><code>')
      }
      $inCode = -not $inCode
      continue
    }
    if ($inCode) {
      [void]$html.AppendLine([System.Net.WebUtility]::HtmlEncode($line))
      continue
    }
    if ($line -match '^\|') {
      if ($line -match '^\|[\s:|-]+\|\s*$') {
        continue
      }
      if (-not $inTable) {
        [void]$html.AppendLine('<table><tbody>')
        $inTable = $true
      }
      [void]$html.Append('<tr>')
      foreach ($cell in ($line.Trim().Trim('|') -split '\|')) {
        [void]$html.Append('<td>' + (Convert-Inline $cell.Trim()) + '</td>')
      }
      [void]$html.AppendLine('</tr>')
      continue
    }
    if ($inTable) {
      [void]$html.AppendLine('</tbody></table>')
      $inTable = $false
    }
    if ($line -match '^\s*(- |\d+\. )(.+)$') {
      $kind = 'ol'
      if ($Matches[1] -eq '- ') {
        $kind = 'ul'
      }
      $item = $Matches[2]
      if ($listKind -ne $kind) {
        if ($listKind) {
          [void]$html.AppendLine("</$listKind>")
        }
        [void]$html.AppendLine("<$kind>")
        $listKind = $kind
      }
      [void]$html.AppendLine('<li>' + (Convert-Inline $item) + '</li>')
      continue
    }
    if ($listKind) {
      [void]$html.AppendLine("</$listKind>")
      $listKind = ''
    }
    if ([string]::IsNullOrWhiteSpace($line)) {
      continue
    }
    if ($line -match '^(#{1,6})\s+(.+)$') {
      $level = $Matches[1].Length
      $rawHeading = $Matches[2]
      $heading = Convert-Inline $rawHeading
      $anchor = ''
      if ($level -eq 1 -and $rawHeading -match '^(\d\d-[^: ]+)') {
        $anchor = ' id="' + $Matches[1] + '"'
      } elseif ($rawHeading -match '^(\d\d-[^ ]+) exercise solution$') {
        $anchor = ' id="' + $Matches[1] + '-solution"'
      }
      [void]$html.AppendLine("<h$level$anchor>$heading</h$level>")
    } else {
      [void]$html.AppendLine('<p>' + (Convert-Inline $line) + '</p>')
    }
  }
  if ($inCode) {
    throw 'Unclosed code fence.'
  }
  if ($listKind) {
    [void]$html.AppendLine("</$listKind>")
  }
  if ($inTable) {
    [void]$html.AppendLine('</tbody></table>')
  }
  return $html.ToString()
}

if (-not $BrowserPath) {
  $programFilesX86 = [Environment]::GetEnvironmentVariable('ProgramFiles(x86)')
  $candidates = @(
    (Join-Path $env:ProgramFiles 'Google\Chrome\Application\chrome.exe'),
    (Join-Path $programFilesX86 'Microsoft\Edge\Application\msedge.exe'),
    (Join-Path $env:ProgramFiles 'Microsoft\Edge\Application\msedge.exe')
  )
  $BrowserPath = $candidates | Where-Object {
    Test-Path -LiteralPath $_
  } | Select-Object -First 1
}
if (-not $BrowserPath -or -not (Test-Path -LiteralPath $BrowserPath)) {
  throw 'Chrome or Edge is required. Supply its executable using -BrowserPath.'
}
$utf8 = New-Object System.Text.UTF8Encoding($false)
$topics = @(
  @{
    Folder = 'CSharp'
    Title = 'C#'
    Guide = 'CSharp-Learning-Guide'
  },
  @{
    Folder = 'PowerShell'
    Title = 'PowerShell'
    Guide = 'PowerShell-Learning-Guide'
  },
  @{
    Folder = 'DotNet10'
    Title = '.NET 10'
    Guide = 'DotNet10-Learning-Guide'
  }
)
$fence = [string][char]96 + [char]96 + [char]96
foreach ($topic in $topics) {
  $directory = Join-Path $PSScriptRoot $topic.Folder
  $guide = New-Object System.Text.StringBuilder
  [void]$guide.AppendLine("# $($topic.Title): from first steps to a complete project")
  [void]$guide.AppendLine('Original learning guide | 14 October 2026 | Read, run, change, explain, practice')
  [void]$guide.AppendLine('All commands assume a PowerShell terminal at the repository root. Code is included for study; use the source files for copying and editing.')
  $intro = [System.IO.File]::ReadAllText((Join-Path $directory 'README.md')) -replace '^#[^\r\n]+\r?\n', ''
  [void]$guide.AppendLine($intro)
  [void]$guide.AppendLine([System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'STYLE.md')))
  [void]$guide.AppendLine([System.IO.File]::ReadAllText((Join-Path $directory 'Git-Practice.md')))
  [void]$guide.AppendLine([System.IO.File]::ReadAllText((Join-Path $PSScriptRoot 'Git-Workflow.md')))
  $referenceIndex = [System.IO.File]::ReadAllText((Join-Path $directory 'Official-References\README.md'))
  $referenceIndex = [regex]::Replace($referenceIndex, '\]\(([^/():]+\.pdf)\)', '](Official-References/$1)')
  [void]$guide.AppendLine($referenceIndex)
  foreach ($lesson in (Get-ChildItem -LiteralPath $directory -Directory | Where-Object Name -Match '^\d\d-' | Sort-Object Name)) {
    $lessonText = [System.IO.File]::ReadAllText((Join-Path $lesson.FullName 'README.md'))
    $lessonText = $lessonText.Replace('(SOLUTION.md)', '(#' + $lesson.Name + '-solution)')
    [void]$guide.AppendLine($lessonText)
    [void]$guide.AppendLine('## Complete example source')
    $sources = Get-ChildItem -LiteralPath $lesson.FullName -Recurse -File |
      Where-Object {
      $_.Extension -in @('.cs', '.csproj', '.ps1', '.psm1', '.json') -and $_.FullName -notmatch '[\\/](bin|obj|output)[\\/]'
    } |
      Sort-Object FullName
    foreach ($source in $sources) {
      $relative = $source.FullName.Substring($lesson.FullName.Length + 1).Replace('\', '/')
      [void]$guide.AppendLine("### $relative")
      [void]$guide.AppendLine($fence + 'text')
      [void]$guide.AppendLine([System.IO.File]::ReadAllText($source.FullName))
      [void]$guide.AppendLine($fence)
    }
    $solution = [System.IO.File]::ReadAllText((Join-Path $lesson.FullName 'SOLUTION.md'))
    $solution = $solution -replace '(?m)^# ', '## ' -replace '(?m)^## (Suggested change|Verify)', '### $1'
    [void]$guide.AppendLine($solution)
  }
  $markdown = $guide.ToString()
  $mdPath = Join-Path $directory ($topic.Guide + '.md')
  $htmlPath = Join-Path $directory ($topic.Guide + '.html')
  $pdfPath = Join-Path $directory ($topic.Guide + '.pdf')
  [System.IO.File]::WriteAllText($mdPath, $markdown, $utf8)
  $body = Convert-Markdown $markdown
  $title = [System.Net.WebUtility]::HtmlEncode($topic.Title)
  $html = @"
<!doctype html>
<html lang="en"><head><meta charset="utf-8"><title>$title Learning Guide</title>
<style>
@page { size:A4; margin:18mm 16mm; @bottom-center { content:"$title learning guide  |  " counter(page); font-size:9pt; color:#64748b; } }
* { box-sizing:border-box; }
body { font-family:Arial,sans-serif; color:#172b43; line-height:1.48; font-size:10.5pt; margin:0; }
main { max-width:180mm; margin:0 auto; }
h1 { color:#124968; font-size:23pt; line-height:1.18; border-top:5px solid #0e8c88; padding-top:12px; break-before:page; }
main > h1:first-child { break-before:auto; }
h2 { color:#165e76; font-size:15pt; margin:20px 0 7px; }
h3 { font-size:11.5pt; }
h1,h2,h3 { break-after:avoid; }
p { margin:9px 0; orphans:3; widows:3; }
li { margin:5px 0; }
a { color:#087b87; text-decoration:none; }
code { font-family:Consolas,'Courier New',monospace; font-size:9pt; }
p code,li code { background:#edf4f7; padding:1px 3px; border-radius:3px; }
pre { background:#edf4f7; border-left:3px solid #0e8c88; padding:10px 12px; margin:12px 0; white-space:pre-wrap; overflow-wrap:anywhere; line-height:1.35; }
pre code { font-size:8.5pt; }
table { width:100%; border-collapse:collapse; margin:12px 0; font-size:9pt; }
td { border:1px solid #d4e3eb; padding:6px; vertical-align:top; }
tr:first-child { background:#e1eff3; font-weight:bold; }
tr { break-inside:avoid; }
@media screen { body { background:#eaf1f5; padding:30px; } main { background:white; padding:35px; box-shadow:0 3px 15px #b4c6d5; max-width:220mm; } }
</style></head><body><main>$body</main></body></html>
"@
  [System.IO.File]::WriteAllText($htmlPath, $html, $utf8)
  $profile = Join-Path $PSScriptRoot ('.tools\pdf-profile-' + $topic.Folder)
  New-Item -ItemType Directory -Path $profile -Force | Out-Null
  $uri = (New-Object System.Uri($htmlPath)).AbsoluteUri
  $arguments = @('--headless', '--disable-gpu', '--disable-background-networking', '--disable-extensions', '--no-first-run', '--no-default-browser-check', '--no-pdf-header-footer', ('--user-data-dir="' + $profile + '"'), ('--print-to-pdf="' + $pdfPath + '"'), $uri)
  $browser = Start-Process -FilePath $BrowserPath -ArgumentList $arguments -PassThru -WindowStyle Hidden
  if (-not $browser.WaitForExit(60000)) {
    $browser.Kill()
    throw "PDF rendering timed out: $($topic.Folder)"
  }
  if ($browser.ExitCode -ne 0 -or -not (Test-Path -LiteralPath $pdfPath)) {
    throw "PDF rendering failed: $($topic.Folder)"
  }
  $bytes = [System.IO.File]::ReadAllBytes($pdfPath)
  if ($bytes.Length -lt 1000 -or [System.Text.Encoding]::ASCII.GetString($bytes, 0, 5) -ne '%PDF-') {
    throw "Invalid PDF: $pdfPath"
  }
  Write-Host "Created $pdfPath ($($bytes.Length) bytes)"
}
