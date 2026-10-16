# 02-Tools: Choose tools and learn the workflow

Level: Beginner | Time: 45-60 minutes | Prerequisite: lesson 01

## Goal

Use a small toolset to inspect a design and trace real execution.

## Understand it

An IDE helps you navigate and debug. The SDK compiles code. Git records changes. A diagram tool communicates structure. None chooses an architecture for you.

Read [Tools.md](../Tools.md). Keep your current editor if it already works. Use paper or draw.io for a first diagram. Add other tools only when a lesson needs them.

## Step by step

From the repository root:

If scripts are blocked, use the process-only execution-policy setup in the [track README](../README.md) first.

```powershell
. .\Initialize-Training.ps1
dotnet --info
git --version
dotnet build .\Architecture\Examples\StudyTasks\StudyTasks.slnx -m:1 -nr:false
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- list
```

A new store lists no tasks. If you have already added tasks, they appear instead. See the [example README](../Examples/StudyTasks/README.md) to choose a separate data path.

Open the example solution. Find Cli/Program.cs, Application/TaskService.cs, Domain/StudyTask.cs, and Infrastructure/JsonTaskStore.cs. Read their names as jobs.

## Exercise

1. Draw learner -> CLI -> data file on paper.
2. Debug add "First architecture task", using the launch-argument setup in Tools.md.
3. Record the methods reached and the value returned.
4. Repeat with a blank title. Find the first method that rejects it.
5. Inspect git status. Explain which files are source and which are generated.

## Done when

You can build from a terminal, find a class, use a breakpoint, and identify the actual storage path. You know that -- separates dotnet run options from your application's arguments.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
