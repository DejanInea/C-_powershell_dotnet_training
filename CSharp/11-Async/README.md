# 11-Async: Async, await, and cancellation

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn tasks, overlapping waits, cancellation, and disposal. Complete [10-Files](../10-Files/README.md) first.

## Understand the idea

A Task represents an operation that may finish later. async enables await inside a method. await waits without synchronously blocking the calling thread. Async is mainly useful for I/O; it does not automatically make CPU-heavy work faster or create a new thread. Both operations start before WhenAll is awaited, so their delays overlap. Their log order can vary. A CancellationToken cooperatively requests cancellation; the operation must observe it. using disposes the cancellation source. Avoid .Result and .Wait when asynchronous calling code can await instead. Catch cancellation separately so a requested stop is not confused with an unexpected failure.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\11-Async
```

## Expected result

```text
Prepared: C#
Prepared: PowerShell
Planned minutes: 50
(The first two lines may appear in either order.)
```

## Exercise

Change the timeout to 10 milliseconds. Predict what happens, then run it. Restore the timeout and explain the difference.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

The simulated delay is 100 milliseconds and receives the token.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-11-cancellation.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-11-cancellation
# Implement the exercise, then verify:
dotnet run --project .\CSharp\11-Async
git diff -- CSharp/11-Async/Program.cs
git add -- CSharp/11-Async/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(csharp): verify planning cancellation"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-11-cancellation`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
