# Think like a Quality Engineer

A Quality Engineer helps the team discover risks, prevent defects, investigate unexpected behavior, and make release decisions using evidence. Quality belongs to the whole team; the tester contributes questions, experiments, and clear communication throughout the project.

This track contains **12 lessons**, exercises and suggested solutions, an editable visual workbook, reusable templates, diagrams, and a runnable API lab.

## Start here

1. Read [01-Mindset](01-Mindset/README.md). No programming prerequisite.
2. Open [QE-Workbook.xlsx](QE-Workbook.xlsx) in Excel or LibreOffice Calc.
3. Open [Visual-Maps.md](Visual-Maps.md) and [Tools.md](Tools.md).
4. Study the [worked project](Worked-Example/README.md), then attempt a lesson exercise before reading its solution.
5. Record evidence in [Progress.md](Progress.md).

Start with a spreadsheet, a diagram, and a notebook. Add API or browser automation after you understand the behavior being checked.

## Learning path

| Lesson | Question you learn to ask | Deliverable |
| --- | --- | --- |
| [01 Mindset](01-Mindset/README.md) | Who could be harmed, and what assumption might be wrong? | A question notebook |
| [02 Requirements](02-Requirements/README.md) | How could we observe whether this is correct? | Reviewed acceptance criteria |
| [03 Risks and worst cases](03-Risks/README.md) | What could fail, how bad would it be, and where should we start? | A ranked worst-case table |
| [04 Test design](04-Test-Design/README.md) | Which small set of tests distinguishes important behaviors? | Boundary, decision, and state tables |
| [05 Visual planning](05-Visual-Planning/README.md) | What has been covered, and what remains uncertain? | Lifecycle plan and traceability |
| [06 Exploration](06-Exploration/README.md) | What does this observation suggest trying next? | An exploratory session report |
| [07 Bug investigation](07-Bug-Investigation/README.md) | Can someone reproduce this from the evidence? | A clear defect report |
| [08 Solutions and retesting](08-Solutions/README.md) | What would prevent this failure without breaking other behavior? | Fix options and verification plan |
| [09 API and data](09-API-Data/README.md) | Is the status, body, state change, and persistence correct? | Local API evidence |
| [10 UI and quality attributes](10-UI-Quality/README.md) | Can people use it under realistic conditions? | Accessibility and quality scenarios |
| [11 Automation](11-Automation/README.md) | Which repeated checks are worth maintaining? | An automation proposal |
| [12 Release and learning](12-Release/README.md) | What evidence and residual risk should inform release? | A test summary and capstone |

Allow 45-60 minutes per lesson and two sessions for the API lab/capstone. Repeat with your own feature after finishing the worked example.

## The visual workbook

The workbook contains StartHere, WorstCases, TestCases, Defects, Coverage, and Lifecycle sheets. It includes filterable tables, frozen headers, editable test statuses, a colored risk score, and a 5-by-5 risk matrix.

Source CSVs are under [Worked-Example](Worked-Example/README.md). All planned test cases begin **Not run**. The sample defect is explicitly fictional. Risk scores are estimates, not measured probabilities. The workbook does not automatically import later lab results; use evidence from the report when updating your own working copy.

See [Workbook-Guide.md](Workbook-Guide.md) for how to use and regenerate it.

## Run the local API lab

After learning basic PowerShell and HTTP:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
.\QualityEngineering\Labs\Invoke-ApiChecks.ps1
```

The lab builds the existing .NET task API, starts its own loopback-only process on an available port, uses a unique disposable data directory, checks HTTP behavior and restart persistence, creates CSV/JSON/HTML results, and stops the processes it started. It does not use your normal task data.

Read [Labs/README.md](Labs/README.md) first. The target is **DotNet10/10-Capstone**: integer IDs, maximum raw title length 200 UTF-16 code units. The Architecture example instead uses GUIDs and an 80-unit normalized title rule. Keep each target's contract separate.

## Keep these beside your editor

- [From start to finish](Project-Lifecycle.md): what QE does at every project stage.
- [Worst-case method](Worst-Case-Method.md): how to build a useful scenario table.
- [Templates](Templates/README.md): plans, test cases, bugs, investigations, and release notes.
- [Glossary](Glossary.md): terminology in plain language.
- [Sources](Sources.md): primary documentation and optional further study.

Use [the Git workflow](../Git-Workflow.md) to review and save focused evidence. The lessons require no external account, tool purchase, issue creation, or publication.
