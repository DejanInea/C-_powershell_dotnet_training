[CmdletBinding()]
param()
Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

function Convert-Xml([string]$Value) {
  return [System.Security.SecurityElement]::Escape($Value)
}

function Get-ColumnName([int]$Index) {
  $name = ''
  while ($Index -gt 0) {
    $Index--
    $name = [char](65 + ($Index % 26)) + $name
    $Index = [int][Math]::Floor($Index / 26)
  }
  return $name
}

function New-Cell([int]$Column, [int]$Row, $Value, [int]$Style = 0,
    [string]$Formula = '') {
  $reference = (Get-ColumnName $Column) + $Row
  $encoded = Convert-Xml ([string]$Value)
  if ($Formula) {
    $type = ''
    if ($Value -isnot [int]) { $type = ' t="str"' }
    return '<c r="' + $reference + '" s="' + $Style + '"' + $type + '><f>' +
      (Convert-Xml $Formula) + '</f><v>' + $encoded + '</v></c>'
  }
  if ($Value -is [int]) {
    return '<c r="' + $reference + '" s="' + $Style + '"><v>' + $encoded + '</v></c>'
  }
  return '<c r="' + $reference + '" s="' + $Style +
    '" t="inlineStr"><is><t xml:space="preserve">' + $encoded + '</t></is></c>'
}

function Write-ZipText([string]$Name, [string]$Content) {
  $entry = $archive.CreateEntry($Name)
  $writer = New-Object IO.StreamWriter($entry.Open(), (New-Object Text.UTF8Encoding($false)))
  try { $writer.Write($Content) } finally { $writer.Dispose() }
}

$specs = @(
  @{ Name = 'WorstCases'; Csv = 'Worst-Case-Scenarios.csv'; StatusColumn = 'L' },
  @{ Name = 'TestCases'; Csv = 'Test-Cases.csv'; StatusColumn = 'K' },
  @{ Name = 'Defects'; Csv = 'Defects.csv'; StatusColumn = '' },
  @{ Name = 'Coverage'; Csv = 'Coverage.csv'; StatusColumn = '' },
  @{ Name = 'Lifecycle'; Csv = 'Lifecycle.csv'; StatusColumn = 'F' }
)
$outputPath = Join-Path $PSScriptRoot 'QE-Workbook.xlsx'
$stream = [IO.File]::Open($outputPath, [IO.FileMode]::Create)
$archive = New-Object IO.Compression.ZipArchive(
    $stream, [IO.Compression.ZipArchiveMode]::Create, $false)
try {
  $namespace = 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'
  $relNamespace = 'http://schemas.openxmlformats.org/officeDocument/2006/relationships'
  $packageNamespace = 'http://schemas.openxmlformats.org/package/2006/relationships'
  $styles = @'
<?xml version="1.0" encoding="utf-8"?>
<styleSheet xmlns="http://schemas.openxmlformats.org/spreadsheetml/2006/main">
<fonts count="3"><font><sz val="11"/><name val="Calibri"/></font><font><b/><color rgb="FFFFFFFF"/><sz val="11"/><name val="Calibri"/></font><font><b/><sz val="16"/><name val="Calibri"/><color rgb="FF153451"/></font></fonts>
<fills count="6"><fill><patternFill patternType="none"/></fill><fill><patternFill patternType="gray125"/></fill><fill><patternFill patternType="solid"><fgColor rgb="FF153451"/><bgColor indexed="64"/></patternFill></fill><fill><patternFill patternType="solid"><fgColor rgb="FFFEE2E2"/><bgColor indexed="64"/></patternFill></fill><fill><patternFill patternType="solid"><fgColor rgb="FFFEF3C7"/><bgColor indexed="64"/></patternFill></fill><fill><patternFill patternType="solid"><fgColor rgb="FFDCFCE7"/><bgColor indexed="64"/></patternFill></fill></fills>
<borders count="1"><border><left/><right/><top/><bottom/><diagonal/></border></borders>
<cellStyleXfs count="1"><xf numFmtId="0" fontId="0" fillId="0" borderId="0"/></cellStyleXfs>
<cellXfs count="6">
<xf numFmtId="0" fontId="0" fillId="0" borderId="0" xfId="0" applyAlignment="1"><alignment vertical="top" wrapText="1"/></xf>
<xf numFmtId="0" fontId="1" fillId="2" borderId="0" xfId="0" applyFont="1" applyFill="1" applyAlignment="1"><alignment vertical="center" wrapText="1"/></xf>
<xf numFmtId="0" fontId="2" fillId="0" borderId="0" xfId="0" applyFont="1"/>
<xf numFmtId="0" fontId="0" fillId="3" borderId="0" xfId="0" applyFill="1" applyAlignment="1"><alignment horizontal="center" vertical="center"/></xf>
<xf numFmtId="0" fontId="0" fillId="4" borderId="0" xfId="0" applyFill="1" applyAlignment="1"><alignment horizontal="center" vertical="center"/></xf>
<xf numFmtId="0" fontId="0" fillId="5" borderId="0" xfId="0" applyFill="1" applyAlignment="1"><alignment horizontal="center" vertical="center"/></xf>
</cellXfs><cellStyles count="1"><cellStyle name="Normal" xfId="0" builtinId="0"/></cellStyles>
<dxfs count="3"><dxf><fill><patternFill patternType="solid"><fgColor rgb="FFFEE2E2"/><bgColor indexed="64"/></patternFill></fill></dxf><dxf><fill><patternFill patternType="solid"><fgColor rgb="FFFEF3C7"/><bgColor indexed="64"/></patternFill></fill></dxf><dxf><fill><patternFill patternType="solid"><fgColor rgb="FFDCFCE7"/><bgColor indexed="64"/></patternFill></fill></dxf></dxfs>
<tableStyles count="0" defaultTableStyle="TableStyleMedium2" defaultPivotStyle="PivotStyleLight16"/>
</styleSheet>
'@
  Write-ZipText 'xl/styles.xml' $styles
  Write-ZipText '_rels/.rels' ('<Relationships xmlns="' + $packageNamespace +
      '"><Relationship Id="rId1" Type="' + $relNamespace +
      '/officeDocument" Target="xl/workbook.xml"/></Relationships>')

  $intro = @(
    @('QE learning workbook', 'Planning examples, not executed results'),
    @('Target', 'Local DotNet10/10-Capstone API: integer IDs; raw title limit 200 UTF-16 units'),
    @('Start', 'Read QualityEngineering/README.md and Workbook-Guide.md'),
    @('WorstCases', 'Rank harm, clarify scope, choose the next experiment'),
    @('TestCases', '16 planned cases; use actual lab evidence when updating your own copy'),
    @('Defects', 'TRAINING-01 is fictional and has no observation evidence'),
    @('Coverage', 'Links express planned coverage, not passing execution'),
    @('Lifecycle', 'Track QE deliverables from discovery through operation'),
    @('Risk formula', 'Likelihood x impact; High >=15, Medium 8-14, Low 1-7; impact 5 always High'),
    @('Status', 'Not run = no evidence; Failed = observed mismatch; Blocked = unable to execute'),
    @('Important', 'Scores are estimates. A colored cell is not evidence of a defect.'),
    @('Execution reports', 'Run Labs/Invoke-ApiChecks.ps1; inspect its unique .artifacts/qe-run-* report'),
    @('Regenerate', 'Build-Workbook.ps1 overwrites this workbook from CSVs; preserve personal notes separately')
  )
  $rows = New-Object Text.StringBuilder
  for ($i = 0; $i -lt $intro.Count; $i++) {
    $row = $i + 1
    [void]$rows.Append('<row r="' + $row + '" ht="40" customHeight="1">')
    [void]$rows.Append((New-Cell 1 $row $intro[$i][0] 1))
    [void]$rows.Append((New-Cell 2 $row $intro[$i][1]))
    [void]$rows.Append('</row>')
  }
  [void]$rows.Append('<row r="15" ht="28" customHeight="1">')
  [void]$rows.Append((New-Cell 1 15 'Risk matrix: impact vs likelihood' 2))
  [void]$rows.Append('</row><row r="17">')
  [void]$rows.Append((New-Cell 1 17 'Impact / Likelihood' 1))
  for ($likelihood = 1; $likelihood -le 5; $likelihood++) {
    [void]$rows.Append((New-Cell ($likelihood + 1) 17 $likelihood 1))
  }
  [void]$rows.Append('</row>')
  for ($impact = 5; $impact -ge 1; $impact--) {
    $row = 23 - $impact
    [void]$rows.Append('<row r="' + $row + '" ht="32" customHeight="1">')
    [void]$rows.Append((New-Cell 1 $row $impact 1))
    for ($likelihood = 1; $likelihood -le 5; $likelihood++) {
      $score = $impact * $likelihood
      $style = 5
      if ($impact -eq 5 -or $score -ge 15) { $style = 3 }
      elseif ($score -ge 8) { $style = 4 }
      [void]$rows.Append((New-Cell ($likelihood + 1) $row $score $style))
    }
    [void]$rows.Append('</row>')
  }
  $introXml = '<worksheet xmlns="' + $namespace +
    '"><sheetViews><sheetView workbookViewId="0"/></sheetViews><cols>' +
    '<col min="1" max="1" width="24" customWidth="1"/>' +
    '<col min="2" max="6" width="13" customWidth="1"/></cols><sheetData>' +
    $rows.ToString() + '</sheetData><mergeCells count="14">'
  for ($row = 1; $row -le 13; $row++) {
    $introXml += '<mergeCell ref="B' + $row + ':F' + $row + '"/>'
  }
  $introXml += '<mergeCell ref="A15:F15"/></mergeCells></worksheet>'
  Write-ZipText 'xl/worksheets/sheet1.xml' $introXml

  $workbookSheets = '<sheet name="StartHere" sheetId="1" r:id="rId1"/>'
  $workbookRels = '<Relationship Id="rId1" Type="' + $relNamespace +
    '/worksheet" Target="worksheets/sheet1.xml"/>'
  $overrides = '<Override PartName="/xl/worksheets/sheet1.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>'
  for ($index = 0; $index -lt $specs.Count; $index++) {
    $spec = $specs[$index]
    $sheetId = $index + 2
    $tableId = $index + 1
    $records = @(Import-Csv -LiteralPath (Join-Path $PSScriptRoot ('Worked-Example\' + $spec.Csv)))
    $headers = @($records[0].PSObject.Properties.Name)
    $lastRow = $records.Count + 1
    $range = 'A1:' + (Get-ColumnName $headers.Count) + $lastRow
    $data = New-Object Text.StringBuilder
    [void]$data.Append('<row r="1" ht="36" customHeight="1">')
    for ($column = 1; $column -le $headers.Count; $column++) {
      [void]$data.Append((New-Cell $column 1 $headers[$column - 1] 1))
    }
    [void]$data.Append('</row>')
    for ($i = 0; $i -lt $records.Count; $i++) {
      $row = $i + 2
      [void]$data.Append('<row r="' + $row + '" ht="72" customHeight="1">')
      for ($column = 1; $column -le $headers.Count; $column++) {
        $header = $headers[$column - 1]
        $value = $records[$i].$header
        $formula = ''
        if ($spec.Name -eq 'WorstCases') {
          if ($header -in @('Likelihood', 'ImpactScore', 'Score')) { $value = [int]$value }
          if ($header -eq 'Score') { $formula = 'F' + $row + '*G' + $row }
          if ($header -eq 'Priority') {
            $formula = 'IF(G' + $row + '=5,"High",IF(H' + $row +
              '>=15,"High",IF(H' + $row + '>=8,"Medium","Low")))'
          }
        }
        [void]$data.Append((New-Cell $column $row $value 0 $formula))
      }
      [void]$data.Append('</row>')
    }
    $extras = ''
    if ($spec.Name -eq 'WorstCases') {
      $extras = '<conditionalFormatting sqref="H2:I' + $lastRow + '">' +
        '<cfRule type="expression" dxfId="0" priority="1" stopIfTrue="1"><formula>OR($G2=5,$H2&gt;=15)</formula></cfRule>' +
        '<cfRule type="expression" dxfId="1" priority="2" stopIfTrue="1"><formula>AND($H2&gt;=8,$H2&lt;15)</formula></cfRule>' +
        '<cfRule type="expression" dxfId="2" priority="3"><formula>$H2&lt;8</formula></cfRule></conditionalFormatting>'
    }
    if ($spec.StatusColumn) {
      $choices = 'Not run,Passed,Failed,Blocked,Not applicable'
      if ($spec.Name -eq 'WorstCases') {
        $choices = 'Not run,Investigating,Mitigated,Known limitation,Needs requirement,Accepted risk'
      }
      if ($spec.Name -eq 'Lifecycle') { $choices = 'Not started,In progress,Done,Blocked' }
      $statusRange = $spec.StatusColumn + '2:' + $spec.StatusColumn + $lastRow
      $validationCount = 1
      $numericValidation = ''
      if ($spec.Name -eq 'WorstCases') {
        $validationCount = 2
        $numericValidation = '<dataValidation type="whole" operator="between" allowBlank="0" showErrorMessage="1" sqref="F2:G' +
          $lastRow + '"><formula1>1</formula1><formula2>5</formula2></dataValidation>'
      }
      $extras += '<dataValidations count="' + $validationCount +
        '"><dataValidation type="list" allowBlank="1" showErrorMessage="1" sqref="' +
        $statusRange + '"><formula1>&quot;' + $choices +
        '&quot;</formula1></dataValidation>' + $numericValidation + '</dataValidations>'
    }
    $worksheet = '<worksheet xmlns="' + $namespace + '" xmlns:r="' + $relNamespace +
      '"><sheetViews><sheetView workbookViewId="0"><pane xSplit="2" ySplit="1" topLeftCell="C2" activePane="bottomRight" state="frozen"/></sheetView></sheetViews>' +
      '<cols><col min="1" max="2" width="18" customWidth="1"/><col min="3" max="' +
      $headers.Count + '" width="36" customWidth="1"/></cols><sheetData>' + $data +
      '</sheetData>' + $extras + '<tableParts count="1"><tablePart r:id="rId1"/></tableParts></worksheet>'
    Write-ZipText ('xl/worksheets/sheet' + $sheetId + '.xml') $worksheet
    $columns = ''
    for ($i = 0; $i -lt $headers.Count; $i++) {
      $columns += '<tableColumn id="' + ($i + 1) + '" name="' + (Convert-Xml $headers[$i]) + '"/>'
    }
    $table = '<table xmlns="' + $namespace + '" id="' + $tableId + '" name="' +
      $spec.Name + 'Table" displayName="' + $spec.Name + 'Table" ref="' + $range +
      '" totalsRowShown="0"><autoFilter ref="' + $range + '"/><tableColumns count="' +
      $headers.Count + '">' + $columns + '</tableColumns><tableStyleInfo name="TableStyleMedium2" showRowStripes="1" showColumnStripes="0"/></table>'
    Write-ZipText ('xl/tables/table' + $tableId + '.xml') $table
    Write-ZipText ('xl/worksheets/_rels/sheet' + $sheetId + '.xml.rels') (
      '<Relationships xmlns="' + $packageNamespace + '"><Relationship Id="rId1" Type="' +
      $relNamespace + '/table" Target="../tables/table' + $tableId + '.xml"/></Relationships>')
    $workbookSheets += '<sheet name="' + $spec.Name + '" sheetId="' + $sheetId + '" r:id="rId' + $sheetId + '"/>'
    $workbookRels += '<Relationship Id="rId' + $sheetId + '" Type="' + $relNamespace +
      '/worksheet" Target="worksheets/sheet' + $sheetId + '.xml"/>'
    $overrides += '<Override PartName="/xl/worksheets/sheet' + $sheetId + '.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.worksheet+xml"/>' +
      '<Override PartName="/xl/tables/table' + $tableId + '.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.table+xml"/>'
  }
  Write-ZipText 'xl/workbook.xml' ('<workbook xmlns="' + $namespace + '" xmlns:r="' +
    $relNamespace + '"><bookViews><workbookView/></bookViews><sheets>' + $workbookSheets +
    '</sheets><calcPr calcId="191029" fullCalcOnLoad="1"/></workbook>')
  $workbookRels += '<Relationship Id="rId7" Type="' + $relNamespace + '/styles" Target="styles.xml"/>'
  Write-ZipText 'xl/_rels/workbook.xml.rels' ('<Relationships xmlns="' +
    $packageNamespace + '">' + $workbookRels + '</Relationships>')
  Write-ZipText '[Content_Types].xml' ('<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">' +
    '<Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>' +
    '<Default Extension="xml" ContentType="application/xml"/>' +
    '<Override PartName="/xl/workbook.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet.main+xml"/>' +
    '<Override PartName="/xl/styles.xml" ContentType="application/vnd.openxmlformats-officedocument.spreadsheetml.styles+xml"/>' +
    $overrides + '</Types>')
} finally {
  $archive.Dispose()
  $stream.Dispose()
}
Write-Host "Workbook ready: $outputPath"
