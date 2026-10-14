# 04-DependencyInjection: Dependency injection and logging

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn containers, service lifetimes, disposal, and structured logs. Complete [03-Configuration](../03-Configuration/README.md) first.

## Understand the idea

A dependency injection container stores registrations and constructs objects with their dependencies. AddSingleton registers one instance for the provider lifetime. AddTransient creates a new instance when resolved. AddScoped creates one instance per scope, commonly an HTTP request. Do not inject a scoped service directly into a singleton; their lifetimes conflict. GetRequiredService fails clearly if a service is not registered. Disposing the provider disposes services it owns. ILogger uses message templates: {Target} names a structured value. This console app references Microsoft.AspNetCore.App to use the installed shared-framework assemblies without NuGet downloads. Logging is diagnostic output; business methods still return data.

## Step by step

1. Open Program.cs and IGoalService.cs, GoalService.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\04-DependencyInjection
```

## Expected result

```text
Remaining: 40 minutes, plus an information log about the target. Log ordering can vary.
```

## Exercise

Resolve IGoalService twice and check ReferenceEquals. Change its registration to AddTransient and repeat.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

The container lifetime controls instance identity.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-04-service-lifetimes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-04-service-lifetimes
# Implement the exercise, then verify:
dotnet run --project .\DotNet10\04-DependencyInjection
git diff -- DotNet10/04-DependencyInjection/README.md DotNet10/04-DependencyInjection/Program.cs
git add -- DotNet10/04-DependencyInjection/README.md DotNet10/04-DependencyInjection/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(dotnet10): compare service lifetimes"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-04-service-lifetimes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
