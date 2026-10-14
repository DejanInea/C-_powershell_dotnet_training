# 05-Methods: Methods and reusable rules

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn parameters, return values, scope, and pure functions. Complete [04-Loops](../04-Loops/README.md) first.

## Understand the idea

A method packages a reusable operation. Its signature names the return type, method, and parameters. Parameters are local to the method. return sends a result back to the caller. These examples use block-bodied methods under the Google style convention; C# also supports expression-bodied methods, which you may see in official documentation. static local functions do not capture surrounding variables. && means and. A pure function calculates a result from its inputs without changing external state, making it easy to test. Keep calculation separate from Console.WriteLine so callers can display, store, or compare the returned result.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\05-Methods
```

## Expected result

```text
10 + 5 = 15
20% of 50 = 10
Valid duration: True
```

## Exercise

Write CalculateTotal(price, quantity). Reject negative prices and quantities below one. Verify 5 times 3 equals 15.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use ArgumentOutOfRangeException for invalid parameters.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-05-total-calculation.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-05-total-calculation
# Implement the exercise, then verify:
dotnet run --project .\CSharp\05-Methods
git diff -- CSharp/05-Methods/Program.cs
git add -- CSharp/05-Methods/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): validate total calculation inputs"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-05-total-calculation`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
