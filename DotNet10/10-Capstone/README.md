# 10-Capstone: A persistent task API

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn routes, validated contracts, persistent state, and concurrency. Complete [09-Publishing](../09-Publishing/README.md) first.

## Understand the idea

This project combines a minimal API, dependency injection, domain rules, immutable records, and a JSON repository. Endpoints coordinate requests; TaskRules defines title validity; TaskRepository owns storage. It uses a lock to serialize changes within one server process, writes a candidate state to a temporary sibling file, replaces the saved file, and only then updates in-memory state. IDs use a persisted counter and are not reused after deletion. Invalid storage stops startup visibly. Returned records and arrays prevent callers from mutating repository internals. This is a local, single-process teaching server. Multiple server processes sharing its file need stronger storage coordination; real public services also need authentication, a database, monitoring, and deployment configuration.

## Step by step

1. Open Program.cs and TaskRepository.cs, TaskRules.cs, StudyTask.cs, StoredTasks.cs, CreateTask.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. If the example is a server, leave it running and use a second terminal for requests; stop it with Ctrl+C afterward.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\10-Capstone -- --urls http://127.0.0.1:5080
# In a second terminal:
.\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Learn .NET 10'
.\PowerShell\10-Capstone\Demo.ps1 -Action List
```

## Expected result

```text
POST creates a task with HTTP 201; list returns an array. Completion returns 200, deletion 204, missing IDs 404, and invalid titles 400. Restarting with the same data path keeps tasks.
```

## Exercise

Add an endpoint that returns total and completed task counts. Extend the root API smoke checks to verify it.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. Restart the server after editing its code.

## Hint

Use a repository snapshot and count matching records.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-10-task-summary.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-10-task-summary
# Implement the exercise, then verify:
# Run this lesson's README server/client checks in the required terminals.
git diff -- DotNet10/10-Capstone/README.md DotNet10/10-Capstone/Program.cs
git add -- DotNet10/10-Capstone/README.md DotNet10/10-Capstone/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(dotnet10): add task summary counts"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-10-task-summary`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
