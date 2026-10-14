# 07-Files: CSV, JSON, paths, and WhatIf

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn persisting data and previewing changes. Complete [06-Functions](../06-Functions/README.md) first.

## Understand the idea

PSScriptRoot is the directory containing the running script, so paths remain stable when the terminal moves. Join-Path joins path components. Export-Csv writes a structured table with column names. Import-Csv returns objects, but CSV field values are strings; cast numeric fields before arithmetic. JSON preserves richer structures and uses a depth limit during serialization. SupportsShouldProcess provides -WhatIf and -Confirm. The call to ShouldProcess decides whether changes should happen. This lesson previews its entire write operation before creating the directory. UTF8 encoding in Windows PowerShell 5.1 includes a byte-order mark; PowerShell 7 uses a different UTF8 default.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\07-Files\Demo.ps1 -WhatIf
.\PowerShell\07-Files\Demo.ps1
```

## Expected result

```text
First command previews the write without changing files. Second command: Rows loaded: 2; total: 50 minutes.
```

## Exercise

Import the JSON file and print only topics with at least 25 minutes. Run WhatIf before making edits.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Get-Content -Raw returns the complete JSON text.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-07-json-filter.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-07-json-filter
# Implement the exercise, then verify:
.\PowerShell\07-Files\Demo.ps1
git diff -- PowerShell/07-Files/Demo.ps1
git add -- PowerShell/07-Files/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): filter saved JSON study data"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-07-json-filter`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
