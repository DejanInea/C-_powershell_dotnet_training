# 03-Decisions: Input validation and decisions

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn parsing, boolean logic, if, and switch. Complete [02-Types](../02-Types/README.md) first.

## Understand the idea

Text from a terminal is not automatically a number. int.TryParse attempts a conversion and returns a Boolean success value. out int age creates a variable for the parsed result. The ! operator negates a Boolean. || means or and short-circuits: later conditions are evaluated only when needed. An if block executes only when its condition is true. return exits the top-level program early. A switch expression selects a result based on patterns. The underscore is the fallback pattern. Validating values before using them keeps incorrect input away from the rest of the program.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\03-Decisions -- 18
```

## Expected result

```text
Age 18: adult
```

## Exercise

Add a senior category for ages 65 and above. Check ages 12, 13, 17, 18, 64, 65, -1 and abc.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Place the >= 65 pattern before the fallback.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-03-senior-category.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-03-senior-category
# Implement the exercise, then verify:
dotnet run --project .\CSharp\03-Decisions
git diff -- CSharp/03-Decisions/Program.cs
git add -- CSharp/03-Decisions/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): classify senior ages"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-03-senior-category`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
