# 12-Capstone: A persistent study tracker and C# 14

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn combining parsing, collections, classes, json, and modern c#. Complete [11-Async](../11-Async/README.md) first.

## Understand the idea

The capstone is a command-line program with persistent data. First it loads the log, then selects a command, applies validation, and saves only after a valid change. The field keyword in the Topic property is a C# 14 feature: the compiler supplies the storage while the accessor enforces a rule. init allows assignment during initialization. JsonConstructor tells the serializer which constructor to use. A temporary sibling file reduces the risk of truncating a good log if serialization fails. This remains a single-user teaching application: simultaneous processes can overwrite each other's updates. Production storage needs concurrency control, backups, and schema migration.

## Step by step

1. Open Program.cs and StudyEntry.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\12-Capstone -- add CSharp 25
dotnet run --project .\CSharp\12-Capstone -- list
```

## Expected result

```text
Added: CSharp, 25 minutes
CSharp: 25 minutes
Entries: 1; total: 25 minutes
(Counts increase if you repeat add.)
```

## Exercise

Add a summary command that prints total minutes per topic. Verify invalid input never changes the saved file.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Group entries by Topic and sum each group inside the switch.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-12-summary-command.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-12-summary-command
# Implement the exercise, then verify:
dotnet run --project .\CSharp\12-Capstone -- summary
git diff -- CSharp/12-Capstone/Program.cs
git add -- CSharp/12-Capstone/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): add a per-topic summary command"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-12-summary-command`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
