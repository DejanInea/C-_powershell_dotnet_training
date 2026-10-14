# 02-Variables: Variables, strings, and collections

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn typed values, interpolation, arrays, and hashtables. Complete [01-Commands](../01-Commands/README.md) first.

## Understand the idea

Variable names start with a dollar sign. PowerShell can infer a type, or a declaration such as [int] can constrain it. Double-quoted strings expand variables; single-quoted strings preserve literal text. Use $() to evaluate an expression inside an expandable string, such as a property access. @() constructs an array. @{} constructs a hashtable of keys and values. The -f operator substitutes numbered placeholders into a format string. Hashtable member syntax is convenient for simple named keys. Avoid names used by automatic variables, including HOME and PID. PowerShell arrays also use zero-based indexing.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\02-Variables\Demo.ps1 -Name Dejan
```

## Expected result

```text
Hello, Dejan!
Topic: PowerShell; minutes: 30
Topic count: 3
Single quotes keep $minutes as literal text.
```

## Exercise

Add a Goal field of 60 minutes to the hashtable and print the remaining minutes.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Subtract the current Minutes value from Goal.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-02-remaining-minutes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-02-remaining-minutes
# Implement the exercise, then verify:
.\PowerShell\02-Variables\Demo.ps1
git diff -- PowerShell/02-Variables/Demo.ps1
git add -- PowerShell/02-Variables/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): calculate remaining study minutes"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-02-remaining-minutes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
