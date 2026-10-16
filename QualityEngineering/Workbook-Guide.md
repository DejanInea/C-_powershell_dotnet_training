# Use the visual workbook

Open [QE-Workbook.xlsx](QE-Workbook.xlsx) in Excel or LibreOffice Calc. Save your working copy under your own project/evidence location.

## The six sheets

| Sheet | How to use it |
| --- | --- |
| StartHere | Read status definitions and the scoring convention; inspect the 5-by-5 risk matrix |
| WorstCases | Filter by scope, sort by risk, and choose what to investigate next |
| TestCases | Read steps and expected results before execution; attach actual evidence afterward |
| Defects | Study an explicitly fictional bug example; replace it with observed evidence in your copy |
| Coverage | Connect requirements to planned checks and gaps |
| Lifecycle | Track deliverables from discovery through operation |

Headers stay visible while scrolling. Use the header filters. Numeric scores and their priorities are formulas, and status cells offer dropdown choices. The source CSVs remain plain-text versions you can inspect in Git.

The table columns are intentionally wider than a printed page. Hide columns temporarily for your current task; do not try to read every field simultaneously on a tablet.

## A short practice session

1. Filter WorstCases to the local API scope.
2. Pick a High risk and read its expected protection.
3. Find linked tests in Coverage and TestCases.
4. If a check is missing, add one to your working table.
5. Run a test against isolated data.
6. Enter actual result, build/run ID, and evidence path.
7. Record Passed only when the observation matches the expectation.

For a Lab result, use the generated HTML/CSV report. The workbook is a planning snapshot and is not automatically synchronized with the runner.

## Regenerate the supplied workbook

From the repository root:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\QualityEngineering\Build-Workbook.ps1
```

This rebuilds QE-Workbook.xlsx from the worked-example CSVs using .NET ZIP/XML libraries. Excel is not required to generate it. It overwrites the supplied workbook, so keep personal execution notes in a separate working copy first.

The workbook has no macros, online dependencies, or external data connections. It contains planned examples; generated lab reports contain actual run results.
