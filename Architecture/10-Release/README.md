# 10-Release: Build, publish, run, recover

Level: Intermediate | Time: 60-90 minutes | Prerequisite: .NET publishing lesson

## Goal

Complete a release using exact commands and a practical runbook.

## Understand it

Build checks that the projects compile. Automated checks verify selected behavior. Publish produces a runnable distribution. Deployment places and configures it. Recovery includes compatible data, not just old binaries.

This exercise is a local release. No network service, hosting account, or public deployment is required.

## Step by step

From the repository root:

```powershell
. .\Initialize-Training.ps1
dotnet build .\Architecture\Examples\StudyTasks\StudyTasks.slnx -c Release -m:1 -nr:false
dotnet run --project .\Architecture\Examples\StudyTasks\Checks -c Release --no-build
dotnet publish .\Architecture\Examples\StudyTasks\Cli -c Release --no-restore --self-contained false -m:1 -nr:false -o .\.artifacts\architecture-release
$env:ARCHITECTURE_TASKS_PATH = Join-Path $PWD '.artifacts\architecture-release-data\tasks.json'
dotnet .\.artifacts\architecture-release\StudyTasks.Cli.dll add "Verify release"
dotnet .\.artifacts\architecture-release\StudyTasks.Cli.dll list
Remove-Item Env:\ARCHITECTURE_TASKS_PATH
```

Expected: the published app adds and lists a task. Repeating this exercise adds more tasks to the same practice store. This framework-dependent publication requires the compatible .NET runtime on the destination machine.

## Exercise

Fill [Runbook.md](../Templates/Runbook.md). Record where binaries and persistent data live. Keep them separate so replacing binaries does not discard data.

Write a CI outline: checkout, SDK setup, Release build, checks, publish artifact. Do not configure deployment credentials yet.

Describe how to back up a stopped store and how to verify restoration using a copy.

## Done when

Someone else can run your release and distinguish invalid input, missing task, and storage failure. Your rollback plan addresses data compatibility.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
