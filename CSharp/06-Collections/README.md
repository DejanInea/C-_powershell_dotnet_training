# 06-Collections: Lists, dictionaries, and null

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn choosing collections and handling missing values. Complete [05-Methods](../05-Methods/README.md) first.

## Understand the idea

A List<T> can grow, unlike a fixed-size array. T is a type parameter; List<string> holds strings. A Dictionary<TKey,TValue> maps unique keys to values. Reading a missing key through the indexer throws; TryGetValue safely checks for it. Dictionary keys are case-sensitive for strings by default; you can provide StringComparer.OrdinalIgnoreCase if that fits your rule. A string? can contain text or null. The null-coalescing operator ?? supplies a fallback. Nullable reference analysis warns about possible null misuse at compile time, but validation is still needed for external data.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\06-Collections
```

## Expected result

```text
C#
PowerShell
.NET 10
C#: 45 minutes
Note: No note yet
```

## Exercise

Add .NET 10 with 60 minutes. Print a total of 135 minutes, using a loop over dictionary values.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Values exposes the stored values; Sum is introduced later.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-06-topic-totals.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-06-topic-totals
# Implement the exercise, then verify:
dotnet run --project .\CSharp\06-Collections
git diff -- CSharp/06-Collections/Program.cs
git add -- CSharp/06-Collections/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): aggregate topic minutes"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-06-topic-totals`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
