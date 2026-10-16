# Start a project from an empty folder

Use this guide after lessons 01-05. It connects the design work to the commands that create a real .NET solution. The supplied example remains your reference, not a folder you must overwrite.

## 1. Describe the smallest useful release

Write a brief using [Requirements.md](Templates/Requirements.md). Choose add, list, and complete for one local learner. Specify persistence, title rules, invalid inputs, and the single-writer assumption. Draw the context and the add-task journey on paper.

## 2. Start with one project if that is enough

A new small program can start with one console project and clear methods. As rules, storage, and presentation grow independently, extract coherent classes and then projects if enforced boundaries help. The five-project layout below is a teaching exercise, not a requirement for every application.

## 3. Create the learning solution

From the repository root in PowerShell, initialize the terminal using the track setup instructions. Create a new practice directory; New-Item deliberately fails if it already exists so you do not accidentally reuse previous work.

```powershell
. .\Initialize-Training.ps1
$practicePath = Join-Path $PWD '.artifacts\architecture-from-zero'
New-Item -ItemType Directory -Path $practicePath -ErrorAction Stop
Push-Location $practicePath
```

While inside that directory, run these commands one at a time. If a command fails, resolve that error before continuing.

```powershell
dotnet new sln --name StudyTasks --format slnx
dotnet new classlib --name StudyTasks.Domain --output Domain --framework net10.0 --no-restore
dotnet new classlib --name StudyTasks.Application --output Application --framework net10.0 --no-restore
dotnet new classlib --name StudyTasks.Infrastructure --output Infrastructure --framework net10.0 --no-restore
dotnet new console --name StudyTasks.Cli --output Cli --framework net10.0 --no-restore
dotnet new console --name StudyTasks.Checks --output Checks --framework net10.0 --no-restore
dotnet sln StudyTasks.slnx add Domain/StudyTasks.Domain.csproj Application/StudyTasks.Application.csproj Infrastructure/StudyTasks.Infrastructure.csproj Cli/StudyTasks.Cli.csproj Checks/StudyTasks.Checks.csproj
```

These commands create templates. They do not yet create the task behavior or architecture checks.

## 4. Connect projects according to the dependency map

Run in the same practice directory:

```powershell
dotnet add Application/StudyTasks.Application.csproj reference Domain/StudyTasks.Domain.csproj
dotnet add Infrastructure/StudyTasks.Infrastructure.csproj reference Application/StudyTasks.Application.csproj Domain/StudyTasks.Domain.csproj
dotnet add Cli/StudyTasks.Cli.csproj reference Application/StudyTasks.Application.csproj Infrastructure/StudyTasks.Infrastructure.csproj
dotnet add Checks/StudyTasks.Checks.csproj reference Application/StudyTasks.Application.csproj Domain/StudyTasks.Domain.csproj Infrastructure/StudyTasks.Infrastructure.csproj
dotnet build StudyTasks.slnx -m:1 -nr:false
Pop-Location
```

You are back at the repository root. The template build should pass. Cli and Checks still contain generated Hello World programs, so their successful execution proves no task behavior yet. Domain must have no references to the other example projects.

The practice files are under .artifacts and intentionally ignored by this training repository's Git settings. When ready for a versioned independent project, choose a deliberate new project location/repository and carry over the SDK, package-source, and style configuration you need. Do not force-add build/practice artifacts here.

## 5. Implement one complete path

Use [the example source walkthrough](Examples/StudyTasks/README.md) as a reference. Replace template code deliberately rather than leaving a second set of unused types.

1. Implement StudyTask in Domain: identity, title normalization, completion state.
2. Implement ITaskStore and TaskService.Add in Application.
3. Implement InMemoryTaskStore in Infrastructure.
4. Wire the store to the service in Cli/Program.cs.
5. Invoke add, and inspect the returned task in the debugger.
6. Replace the generated Checks program with a check that accepts a valid title and rejects a blank one.

You now have a narrow working path. In-memory data disappears when the process exits; document that temporary limitation before adding persistence.

## 6. Add persistence and the remaining actions

Implement the JSON adapter and its storage representation. Add list and complete use cases. Select JSON in the composition root. Exercise each action in a new process to demonstrate persistence. Check missing IDs, bad arguments, malformed storage, and write failures.

Use the sample's files to compare your result after your attempt. Run the supplied 16 checks against the supplied example; adapt equivalent behavior checks for your practice project as you implement it.

## 7. Review the architecture

Complete [Architecture.md](Templates/Architecture.md) and one [ADR](Templates/ADR.md). Check that title rules have one owner, Application does not reference Infrastructure, and CLI messages agree with actual failures. Explain the single-writer and crash-recovery limits.

## 8. Publish and hand over

Follow [lesson 10](10-Release/README.md), adapting its project paths to your practice directory. Build Release, run your completed checks, publish, and smoke-test the published app with disposable data outside the binary folder. Write a runbook that another learner can follow.

## 9. Make one later change

Use [the rename capstone](12-Capstone/README.md). Add acceptance criteria, update the diagrams, implement the smallest affected parts, rerun checks, and publish again. Compare the changed files to your original responsibility map.

The result is a full development cycle: problem -> model -> dependency decisions -> working path -> persistence -> checks -> release -> informed change.
