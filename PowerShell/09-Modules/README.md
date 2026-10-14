# 09-Modules: Reusable modules and reporting

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn module boundaries, exports, begin/process/end, and aggregation. Complete [08-Errors](../08-Errors/README.md) first.

## Understand the idea

A .psm1 file contains reusable module code. Import-Module loads it into the current process. Export-ModuleMember controls the functions exposed to callers. A begin block initializes state, process handles each input item, and end produces a final aggregate. The module here validates each object's fields and uses a typed collection to accumulate entries. Functions should document their accepted input shape and return structured results so callers can filter or export them. This small module does not require an online gallery or installation. A larger module can add a .psd1 manifest with version information and declared exports.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\09-Modules\Demo.ps1
```

## Expected result

```text
C#: 2 sessions, 75 minutes
PowerShell: 1 sessions, 20 minutes
```

## Exercise

Add AverageMinutes to each summary object. Check C# gives 37.5.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Compute the average on the numeric Minutes property inside the end block.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-09-average-minutes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-09-average-minutes
# Implement the exercise, then verify:
.\PowerShell\09-Modules\Demo.ps1
git diff -- PowerShell/09-Modules/Demo.ps1 PowerShell/09-Modules/StudyTools.psm1
git add -- PowerShell/09-Modules/Demo.ps1 PowerShell/09-Modules/StudyTools.psm1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): add average minutes to summaries"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-09-average-minutes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
