# 05-Pipeline: Filtering, sorting, and measuring

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn pipeline objects, the current item, and aggregation. Complete [04-Objects](../04-Objects/README.md) first.

## Understand the idea

A pipeline connects command output to command input. Where-Object filters objects with a script block. $_ is the current pipeline item inside that block. Sort-Object sorts using a property. ForEach-Object applies work to each item; foreach is a language statement used differently. Measure-Object computes aggregates. Assigning pipeline output captures the resulting objects. With zero or one results, ordinary assignment may give null or a single object rather than an array; @(...pipeline...) normalizes the result to an array. Use -LiteralPath when a path should be treated exactly instead of as a wildcard expression.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\05-Pipeline\Demo.ps1
```

## Expected result

```text
C#: 45 minutes
.NET 10: 30 minutes
Total: 95 minutes
```

## Exercise

Filter sessions below 30 minutes and print their count. Then group by Topic.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Wrap the filtered pipeline in @() before reading Count.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-05-short-sessions.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-05-short-sessions
# Implement the exercise, then verify:
.\PowerShell\05-Pipeline\Demo.ps1
git diff -- PowerShell/05-Pipeline/Demo.ps1
git add -- PowerShell/05-Pipeline/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): count filtered short sessions"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-05-short-sessions`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
