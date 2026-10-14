# 03-Configuration: JSON settings and environment variables

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn configuration as data and explicit precedence. Complete [02-Library](../02-Library/README.md) first.

## Understand the idea

Configuration changes behavior without editing business logic. The project copies settings.json into the build output directory, where the application can locate it relative to AppContext.BaseDirectory. This lesson loads a JSON default and then applies one environment-variable override. It implements that precedence explicitly; a later ASP.NET Core application uses the framework configuration system instead. Environment variables are text, so parse and validate them. Keep credentials out of repository configuration files. A malformed JSON file or invalid override stops this program with a clear exception instead of silently changing the target. Relative paths from the terminal are less reliable than application-relative paths.

## Step by step

1. Open Program.cs and StudySettings.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\03-Configuration
```

## Expected result

```text
Course: .NET 10; daily target: 30 minutes
```

## Exercise

Run with a daily target of 45 using an environment variable. Restore its previous value afterward.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Environment changes here affect the current terminal and its child processes.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-03-environment-override.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-03-environment-override
# Implement the exercise, then verify:
dotnet run --project .\DotNet10\03-Configuration
git diff -- DotNet10/03-Configuration/README.md DotNet10/03-Configuration/Program.cs
git add -- DotNet10/03-Configuration/README.md DotNet10/03-Configuration/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(dotnet10): verify the daily target override"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-03-environment-override`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
