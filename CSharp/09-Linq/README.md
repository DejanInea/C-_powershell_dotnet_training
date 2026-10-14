# 09-Linq: LINQ queries and lambdas

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn filtering, projection, aggregation, and deferred execution. Complete [08-Interfaces](../08-Interfaces/README.md) first.

## Understand the idea

LINQ applies query operations to sequences. A lambda such as s => s.Minutes >= 30 is a small function used as a predicate. Where filters; Select transforms; OrderBy sorts; Sum aggregates; GroupBy partitions by a key. Many sequence operators are deferred: they run when the result is enumerated. ToList evaluates the query and stores a snapshot. If the source changes before enumeration, a deferred query can observe the change. Keep predicates free of side effects. LINQ over an in-memory list differs from database LINQ, where a provider may translate expressions into SQL.

## Step by step

1. Open Program.cs and Session.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\09-Linq
```

## Expected result

```text
C#: 45
C#: 30
Total: 110
.NET 10 total: 15
C# total: 75
PowerShell total: 20
```

## Exercise

Find the average session length and create a list of distinct topic names. Expect 27.5 minutes and three topics.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use Average, Select, and Distinct; format numbers invariantly if necessary.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-09-topic-summary.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-09-topic-summary
# Implement the exercise, then verify:
dotnet run --project .\CSharp\09-Linq
git diff -- CSharp/09-Linq/Program.cs
git add -- CSharp/09-Linq/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): summarize distinct study topics"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-09-topic-summary`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
