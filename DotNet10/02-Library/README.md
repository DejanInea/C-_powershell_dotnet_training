# 02-Library: A library and project references

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn reusable assemblies and solution organization. Complete [01-Sdk](../01-Sdk/README.md) first.

## Understand the idea

A class library compiles reusable code without an executable entry point. A console app can reference it through ProjectReference. The compiler checks the dependency and builds it in the correct order. A namespace groups related types and helps avoid naming conflicts. public exposes library types to consumers. A solution groups projects for editor navigation and one-command builds; it does not replace project references. The Library folder contains StudyBudget, while App contains the executable. Keep business rules in the library and terminal-specific presentation in the app. You can test a library without running a terminal interface.

## Step by step

1. Open App/Program.cs and Library/StudyBudget.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\02-Library\App
```

## Expected result

```text
3 sessions x 25 minutes = 75 minutes
Goal reached: True
```

## Exercise

Add RemainingMinutes(completed, goal), never returning a negative result. Reject negative inputs. Use it from App.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use Math.Max after validating both inputs.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-02-remaining-minutes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-02-remaining-minutes
# Implement the exercise, then verify:
dotnet run --project .\DotNet10\02-Library\App
git diff -- DotNet10/02-Library/README.md DotNet10/02-Library/Library/StudyBudget.cs DotNet10/02-Library/App/Program.cs
git add -- DotNet10/02-Library/README.md DotNet10/02-Library/Library/StudyBudget.cs DotNet10/02-Library/App/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(dotnet10): add a remaining minutes calculation"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-02-remaining-minutes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
