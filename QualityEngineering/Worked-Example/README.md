# Worked project: local study-task API

Use [DotNet10/10-Capstone](../../DotNet10/10-Capstone/README.md) as the real target. Its [contract](Contract.md) is the basis for the supplied cases. This is different from the Architecture track's CLI.

## Files you can inspect or edit

- [Worst-Case-Scenarios.csv](Worst-Case-Scenarios.csv): 18 risk examples, with scope and estimates.
- [Test-Cases.csv](Test-Cases.csv): 16 planned cases corresponding to the PowerShell lab.
- [Defects.csv](Defects.csv): one explicitly fictional training example, not an observed repository bug.
- [Coverage.csv](Coverage.csv): requirements, cases, and remaining gaps.
- [Lifecycle.csv](Lifecycle.csv): project-stage deliverables.
- [QE workbook](../QE-Workbook.xlsx): the same data in a visual spreadsheet.

CSV text is encoded as UTF-8. In a spreadsheet import dialog, choose comma as delimiter and double quote as text qualifier.

## How to use the example

Read a requirement, locate its risk, inspect the case, predict the result, execute against isolated data, and record evidence. Then explain a gap the passing case does not address.

The runner writes actual results into a unique .artifacts/qe-run-* folder. The source CSV/workbook cases stay Not run as reusable planning material. Update a separate working copy based on your own execution.

Do not represent a fictional defect or planned risk as an observed failure. No real defects are assumed merely because a worksheet contains a row.
