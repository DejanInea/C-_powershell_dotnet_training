# 02-Types: Variables, types, and numbers

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn types, arithmetic, and formatting. Complete [01-Hello](../01-Hello/README.md) first.

## Understand the idea

A variable has a name, a type, and a value. int stores whole numbers; decimal stores base-10 values useful for money; double stores approximate floating-point values; bool stores true or false. The m suffix makes a numeric literal a decimal. A cast such as (double)completed converts a value explicitly. Dividing two integers truncates the fractional part, so 3 / 12 gives zero; convert one operand before dividing. F2 prints two decimal places. CultureInfo.InvariantCulture makes the decimal separator predictable. var would ask the compiler to infer a type; it does not make the variable dynamically typed.

## Step by step

The fixed sample values use const because they are known at compile time. A constant cannot be reassigned; an ordinary variable can. Later lessons use mutable counters and collections when values need to change.

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\02-Types
```

## Expected result

```text
C#: 3 lessons; beginner=True
Total: 25.00 EUR
Progress: 25 %
```

## Exercise

Calculate the price after a 20% discount and print 10.00 EUR.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

A 20% discount leaves 80% of the original amount.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-02-discount.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-02-discount
# Implement the exercise, then verify:
dotnet run --project .\CSharp\02-Types
git diff -- CSharp/02-Types/Program.cs
git add -- CSharp/02-Types/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): calculate discounted study prices"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-02-discount`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
