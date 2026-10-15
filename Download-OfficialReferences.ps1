[CmdletBinding()]
param(
  [switch]$DownloadOnly,
  [string]$BrowserPath,
  [ValidateSet('CSharp', 'PowerShell', 'DotNet10', 'Git')]
  [string[]]$Topic = @('CSharp', 'PowerShell', 'DotNet10', 'Git')
)
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$utf8 = New-Object System.Text.UTF8Encoding($false)
$entries = Get-Content -LiteralPath (Join-Path $PSScriptRoot 'Official-Resources.json') -Raw | ConvertFrom-Json
$entries = @($entries | Where-Object { $_.Topic -in $Topic })
$needsBrowser = -not $DownloadOnly -and @(
  $entries | Where-Object { $_.Kind -ne 'Publisher PDF' }
).Count -gt 0
$cache = Join-Path $PSScriptRoot '.artifacts\reference-sources'
New-Item -ItemType Directory -Path $cache -Force | Out-Null
if (-not (Get-Command curl.exe -ErrorAction SilentlyContinue)) {
  throw 'curl.exe is required to download references.'
}
if ($needsBrowser -and -not $BrowserPath) {
  $x86 = [Environment]::GetEnvironmentVariable('ProgramFiles(x86)')
  $BrowserPath = @(
    (Join-Path $env:ProgramFiles 'Google\Chrome\Application\chrome.exe'),
    (Join-Path $x86 'Microsoft\Edge\Application\msedge.exe')
  ) | Where-Object {
    Test-Path -LiteralPath $_
  } | Select-Object -First 1
}
if ($needsBrowser -and -not $BrowserPath) {
  throw 'Install Chrome/Edge or provide -BrowserPath.'
}

function Download-File([string]$Url, [string]$Destination) {
  & curl.exe --fail --location --silent --show-error --retry 2 --connect-timeout 15 --max-time 60 $Url --output $Destination
  if ($LASTEXITCODE -ne 0) {
    throw "Download failed ($LASTEXITCODE): $Url"
  }
}
function Check-Pdf([string]$Path) {
  $bytes = [System.IO.File]::ReadAllBytes($Path)
  if ($bytes.Length -lt 1000 -or [System.Text.Encoding]::ASCII.GetString($bytes,0,5) -ne '%PDF-') {
    throw "The downloaded/rendered file is not a PDF: $Path"
  }
}
function Get-ArticleContent([string]$Html) {
  $builder = New-Object System.Text.StringBuilder
  $lastEnd = -1
  foreach ($start in [regex]::Matches($Html, '(?is)<div\b[^>]*class="content"[^>]*>')) {
    if ($start.Index -lt $lastEnd) {
      continue
    }
    $depth = 1
    $bodyStart = $start.Index + $start.Length
    $end = -1
    foreach ($tag in [regex]::Matches($Html.Substring($bodyStart), '(?is)<div\b[^>]*>|</div\s*>')) {
      if ($tag.Value.StartsWith('</')) {
        $depth--
      } else {
        $depth++
      }
      if ($depth -eq 0) {
        $end = $bodyStart + $tag.Index
        $lastEnd = $end + $tag.Length
        break
      }
    }
    if ($end -lt 0) {
      throw 'Unbalanced article container.'
    }
    [void]$builder.AppendLine($Html.Substring($bodyStart, $end - $bodyStart))
  }
  $body = $builder.ToString()
  if ($body.Length -lt 200 -or $body -notmatch '<h1') {
    throw 'The official page did not contain a complete article.'
  }
  $body = [regex]::Replace($body, '(?is)<script\b[^>]*>.*?</script>', '')
  $body = [regex]::Replace($body, '(?is)<style\b[^>]*>.*?</style>', '')
  return $body
}
$records = New-Object 'System.Collections.Generic.List[object]'
$failures = New-Object 'System.Collections.Generic.List[string]'
foreach ($entry in $entries) {
  try {
    if ($entry.Topic -notin @('CSharp','PowerShell','DotNet10','Git') -or [System.IO.Path]::GetFileName($entry.FileName) -ne $entry.FileName) {
      throw 'A manifest path is outside the supported topic folders.'
    }
    $directory = Join-Path $PSScriptRoot ($entry.Topic + '\Official-References')
    New-Item -ItemType Directory -Path $directory -Force | Out-Null
    $pdf = Join-Path $directory $entry.FileName
    $temporary = Join-Path $cache ($entry.Topic + '-' + $entry.FileName + '.download')
    $sourceHash = $null
    $sourceDate = $null
    if ($entry.Kind -eq 'Publisher PDF') {
      Download-File $entry.Url $temporary
      Check-Pdf $temporary
      Move-Item -LiteralPath $temporary -Destination $pdf -Force
    } else {
      Download-File $entry.Url $temporary
      $sourceHash = (Get-FileHash -LiteralPath $temporary -Algorithm SHA256).Hash
      $rawHtml = [System.IO.File]::ReadAllText($temporary)
      $dateMatch = [regex]::Match($rawHtml, '<meta name="ms.date" content="([^"]+)"')
      if ($dateMatch.Success) {
        $sourceDate = $dateMatch.Groups[1].Value
      }
      $article = Get-ArticleContent $rawHtml
      $htmlPath = [System.IO.Path]::ChangeExtension($pdf, '.html')
      $url = [System.Net.WebUtility]::HtmlEncode($entry.Url)
      $title = [System.Net.WebUtility]::HtmlEncode($entry.Description)
      $exportDate = Get-Date -Format 'yyyy-MM-dd'
      $versionStyle = ''
      $viewMatch = [regex]::Match($entry.Url, '[?&]view=([^&]+)')
      if ($viewMatch.Success) {
        $view = [Uri]::UnescapeDataString($viewMatch.Groups[1].Value)
        if ($view -notmatch '^[a-zA-Z0-9.-]+$') {
          throw 'Unsupported documentation view.'
        }
        # Learn embeds several versions in one HTML document; print only the requested view.
        $versionStyle = '[data-moniker]:not([data-moniker~="' + $view + '"]) { display:none !important; }'
      }
      $html = @"
<!doctype html><html lang="en"><head><meta charset="utf-8"><base href="$url"><title>$title</title>
<style>
@page { size:A4; margin:18mm 15mm; @bottom-center { content:"Microsoft documentation print copy | " counter(page); font:9pt Arial; color:#64748b; } }
body { font:10.5pt/1.5 Arial,sans-serif; color:#172b43; margin:0; }
h1 { font-size:24pt; color:#124968; } h2 { font-size:16pt; color:#165e76; } h3 { font-size:12pt; }
h1,h2,h3 { break-after:avoid; } p { orphans:3; widows:3; }
pre { background:#edf4f7; padding:10px; border-left:3px solid #0e8c88; white-space:pre-wrap; overflow-wrap:anywhere; font:8.5pt/1.35 Consolas,monospace; }
code { font-family:Consolas,monospace; overflow-wrap:anywhere; } table { width:100%; border-collapse:collapse; font-size:9pt; }
td,th { border:1px solid #ccdbe5; padding:5px; } tr { break-inside:avoid; }
img,svg { max-width:100%; height:auto; } a { color:#087b87; overflow-wrap:anywhere; }
.provenance { border-top:4px solid #0e8c88; padding:10px 0; font-size:9pt; }
.note,.TIP,.NOTE,.IMPORTANT,.WARNING { background:#eff5f7; padding:8px; }
button,.display-none-print { display:none; } details { display:block; }
$versionStyle
</style></head><body>
<div class="provenance"><strong>Print copy of official Microsoft Learn documentation</strong>
<p>Source: <a href="$url">$url</a><br>Exported: $exportDate. Source metadata date: $sourceDate.</p>
<p>Microsoft and documentation contributors. Article wording and code for the requested version are retained; web navigation is removed and print formatting is added. This locally generated PDF is not a Microsoft-published PDF book or a complete product manual. Source-page attribution and notices apply.</p>
<p>Documentation license and terms: <a href="https://learn.microsoft.com/en-us/legal/termsofuse">Microsoft Learn terms</a>; .NET documentation: <a href="https://github.com/dotnet/docs/blob/main/LICENSE">CC BY 4.0 license</a>. Check the source for specific attribution or exceptions.</p>
</div>
$article
</body></html>
"@
      [System.IO.File]::WriteAllText($htmlPath,$html,$utf8)
      if ($DownloadOnly) {
        Write-Host "Downloaded article: $($entry.FileName)"
        continue
      }
      $profile = Join-Path $PSScriptRoot '.tools\pdf-official-references'
      New-Item -ItemType Directory -Path $profile -Force | Out-Null
      $uri = (New-Object System.Uri($htmlPath)).AbsoluteUri
      $arguments = @('--headless','--disable-gpu','--disable-background-networking','--disable-extensions','--no-first-run','--no-default-browser-check','--no-pdf-header-footer',('--user-data-dir="' + $profile + '"'),('--print-to-pdf="' + $pdf + '"'),$uri)
      $browser = Start-Process -FilePath $BrowserPath -ArgumentList $arguments -WindowStyle Hidden -PassThru
      if (-not $browser.WaitForExit(60000)) {
        $browser.Kill()
        throw 'PDF render timed out.'
      }
      if ($browser.ExitCode -ne 0) {
        throw 'PDF render failed.'
      }
      Check-Pdf $pdf
    }
    $record = [pscustomobject]@{
      File = ($entry.Topic + '/Official-References/' + $entry.FileName)
      Kind = $entry.Kind
      Source = $entry.Url
      PublisherPage = $entry.PublisherPage
      SourceMetadataDate = $sourceDate
      RetrievedAtUtc = [DateTime]::UtcNow.ToString('o')
      Bytes = (Get-Item -LiteralPath $pdf).Length
      Sha256 = (Get-FileHash -LiteralPath $pdf -Algorithm SHA256).Hash
      SourceHtmlSha256 = $sourceHash
    }
    $records.Add($record)
    Write-Host "Ready: $($record.File) [$($record.Bytes) bytes]"
  } catch {
    $failures.Add("$($entry.FileName): $($_.Exception.Message)")
    Write-Warning $failures[$failures.Count - 1]
  }
}
foreach ($topicName in @($entries.Topic | Select-Object -Unique)) {
  $directory = Join-Path $PSScriptRoot ($topicName + '\Official-References')
  New-Item -ItemType Directory -Path $directory -Force | Out-Null
  $topicRecords = @($records | Where-Object {
      $_.File.StartsWith($topicName + '/')
  })
  [System.IO.File]::WriteAllText((Join-Path $directory 'Download-Record.json'), (ConvertTo-Json -InputObject $topicRecords -Depth 5), $utf8)
}
if ($failures.Count) {
  throw ($failures -join [Environment]::NewLine)
}
Write-Host "Reference collection complete: $($records.Count) PDFs."
