# 08-Interfaces: Interfaces and composition

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn contracts, polymorphism, and dependency injection. Complete [07-Classes](../07-Classes/README.md) first.

## Understand the idea

An interface describes operations without choosing a specific implementation. ConsoleNotifier implements INotifier. A variable typed INotifier can refer to any implementation of that contract. StudyTracker receives its dependency through its constructor rather than constructing one internally. This is dependency injection; it works without a framework. The primary constructor syntax places the constructor parameters on the class declaration. Composition joins small objects to provide behavior. Replacing the notifier can change output without rewriting the tracker. This is a useful foundation for testing and for the .NET dependency injection lesson.

## Step by step

1. Open Program.cs, INotifier.cs, ConsoleNotifier.cs, and StudyTracker.cs. Read their comments.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\08-Interfaces
```

## Expected result

```text
Completed: Interfaces
```

## Exercise

Create a MemoryNotifier that stores messages in a List<string>. Call Finish twice and verify that it captured two messages.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Expose a read-only view or list property for inspection.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-08-memory-notifier.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-08-memory-notifier
# Implement the exercise, then verify:
dotnet run --project .\CSharp\08-Interfaces
git diff -- CSharp/08-Interfaces/Program.cs
git add -- CSharp/08-Interfaces/Program.cs CSharp/08-Interfaces/MemoryNotifier.cs
git diff --cached
git diff --cached --check
git commit -m "test(csharp): capture notifier messages in memory"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-08-memory-notifier`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
