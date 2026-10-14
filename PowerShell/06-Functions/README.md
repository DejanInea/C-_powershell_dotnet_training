# 06-Functions: Functions and pipeline parameters

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn advanced functions, process blocks, and output streams. Complete [05-Pipeline](../05-Pipeline/README.md) first.

## Understand the idea

A function groups reusable commands. CmdletBinding enables common parameters such as -Verbose and -ErrorAction. Mandatory requires the caller to supply a value. ValueFromPipeline binds each input object to the parameter. The process block executes for each pipeline item. ValidateRange rejects unsuitable values. PowerShell emits every uncaptured expression on the success stream, so accidental output inside a function can contaminate its result. Use Write-Verbose for diagnostic messages and structured objects for results. Unlike C#, return is not the only way to produce output; it also ends the current function or block execution path.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\06-Functions\Demo.ps1
```

## Expected result

```text
30 minutes = 0.5 hours
60 minutes = 1 hours
90 minutes = 1.5 hours
(Decimal separators follow your shell culture.)
```

## Exercise

Add a Days property where one study day is eight hours. Verify 480 minutes produces Days=1.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Divide Minutes by 60 and then by 8 in the output object.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-06-study-days.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-06-study-days
# Implement the exercise, then verify:
.\PowerShell\06-Functions\Demo.ps1
git diff -- PowerShell/06-Functions/Demo.ps1
git add -- PowerShell/06-Functions/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): convert minutes to study days"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-06-study-days`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
