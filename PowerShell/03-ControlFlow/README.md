# 03-ControlFlow: Conditions and loops

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn comparison operators, branching, and repetition. Complete [02-Variables](../02-Variables/README.md) first.

## Understand the idea

PowerShell comparisons use named operators: -eq, -ne, -gt, -ge, -lt and -le. Do not use a single equals sign to compare; it assigns a value. if chooses a branch. foreach visits items in a collection. A for loop is useful when you need a counter. ValidateRange rejects a parameter outside its allowed range before the script body runs. PowerShell strings compare case-insensitively by default; -ceq is case-sensitive equality. A while loop repeats while a condition holds and requires a way to finish. Prefer parameter validation over trusting input.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\03-ControlFlow\Demo.ps1 -Minutes 30
```

## Expected result

```text
Long session
Total: 60 minutes
Round 1
Round 2
Round 3
```

## Exercise

Count how many values in 10, 20, 30, 40 are at least 30. Expect 2.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use a counter, foreach, and -ge.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-03-session-count.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-03-session-count
# Implement the exercise, then verify:
.\PowerShell\03-ControlFlow\Demo.ps1
git diff -- PowerShell/03-ControlFlow/Demo.ps1
git add -- PowerShell/03-ControlFlow/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): count long study sessions"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-03-session-count`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
