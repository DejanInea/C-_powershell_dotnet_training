# 08-Testing: Test behavior and boundaries

Level: Intermediate | Time: 60-90 minutes | Prerequisite: lesson 07; .NET testing lesson

## Goal

Use checks that show architectural boundaries preserve meaningful behavior.

## Understand it

A domain check needs no disk. An application check can use an in-memory collaborator. A storage integration check writes isolated real files. A CLI smoke check exercises the public command line in another process.

The supplied Checks project is an executable harness with nonzero failure exit status. It uses no test packages. Run it with dotnet run, not dotnet test. Later, test frameworks and runners can improve discovery and reporting.

## Run

```powershell
dotnet run --project .\Architecture\Examples\StudyTasks\Checks
```

Checks create unique data under .artifacts and preserve it for inspection. No real CLI data is used.

## Important checks

- A blank title is rejected without saving.
- The length boundary accepts 80 and rejects 81.
- Completing a missing ID does not write.
- Completing twice preserves identity and one task.
- Save failure escapes the application layer.
- Real JSON survives constructing a new store instance.
- Corrupt input and duplicate IDs fail visibly.

These verify observable contracts rather than exact private-method order.

## Exercise

1. Predict a check result before opening Checks/Program.cs.
2. In a practice copy, remove title validation. Which check fails?
3. Restore the rule. Make Save silently do nothing. Which check detects persistence loss?
4. Compare an in-memory check with a real-file check. What could the fake miss?
5. Sketch a dependency rule check from actual .csproj references.

## Done when

You can explain which failures are covered, which are not, and why a green check suite cannot prove crash recovery or concurrency safety.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
