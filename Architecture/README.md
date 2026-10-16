# Code architecture: from an idea to a maintainable application

Architecture is how you divide a program into parts, define their responsibilities, and decide how they work together. Learn to explain a decision and its cost before learning more pattern names.

This track has **12 lessons**, exercises with suggested solutions, visual maps, reusable planning templates, and a runnable .NET 10 example. It teaches the full cycle: understand a problem, design, build, verify, release, and improve. Examples use a personal study-task tracker throughout.

## Start here

You can do lessons 01-04 now with paper and your editor. Before coding lessons 05-08, finish C# 01-08 and the .NET project/library lessons. Study the .NET testing and publishing lessons before lessons 08-10. You do not need to understand every project in the example on day one.

1. Read [01-Problem](01-Problem/README.md). Write three things your app must do.
2. Read [Tools.md](Tools.md) and choose one editor and one diagram tool.
3. Open [Visual-Maps.md](Visual-Maps.md). SVG pictures open directly in a browser.
4. Spend 45-60 minutes per lesson: read, sketch, attempt, compare, explain.
5. Record your evidence in [Progress.md](Progress.md).

After lessons 01-05, follow [From-Zero.md](From-Zero.md) to create your own solution from an empty folder, connect projects, implement a first path, and take it through release.

## Learning path

| Lesson | You learn | You produce |
| --- | --- | --- |
| [01 Problem](01-Problem/README.md) | Users, constraints, acceptance criteria | A one-page requirements brief |
| [02 Tools and workflow](02-Tools/README.md) | Editor, debugger, SDK, Git, diagrams | A working toolchain and first debug session |
| [03 Responsibilities](03-Responsibilities/README.md) | Separate input, rules, coordination, storage | Responsibility cards and a change map |
| [04 Visual models](04-Visual-Models/README.md) | Context, containers, components, sequences | Two diagrams with labeled arrows |
| [05 Dependencies](05-Dependencies/README.md) | Interfaces, project references, composition | A dependency map tied to real code |
| [06 Architecture choices](06-Architecture-Choices/README.md) | Layering, clean boundaries, vertical slices, monoliths | A justified architecture decision |
| [07 Data and contracts](07-Data-Contracts/README.md) | Models, persistence, schema changes, errors | A data contract and failure policy |
| [08 Testing](08-Testing/README.md) | Domain, application, storage, end-to-end checks | Evidence that boundaries preserve behavior |
| [09 Quality and security](09-Quality/README.md) | Measurable goals and failure analysis | A short risk and quality review |
| [10 Build and release](10-Release/README.md) | Build, publish, configuration, rollback | A local release and runbook |
| [11 Evolve a design](11-Evolution/README.md) | Refactoring, modules, scaling decisions | A measured change proposal |
| [12 Capstone](12-Capstone/README.md) | Bring the whole process together | A reviewed implementation and handover |

Plan three sessions per week for four weeks, or take longer while finishing the C# track. Lessons 05-08 may take two sessions each.

## Run the supplied example

Commands run from the repository root in PowerShell:

If PowerShell blocks local scripts, first run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` in this terminal, as described in the repository's setup guide. Organization-enforced policies still apply.

```powershell
. .\Initialize-Training.ps1
dotnet build .\Architecture\Examples\StudyTasks\StudyTasks.slnx -m:1 -nr:false
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- add "Read about dependencies"
dotnet run --project .\Architecture\Examples\StudyTasks\Cli -- list
dotnet run --project .\Architecture\Examples\StudyTasks\Checks
```

The first command adds a task and prints its ID. List shows saved tasks. The checks report named PASS/FAIL results and return a nonzero exit code on failure. See the [example walkthrough](Examples/StudyTasks/README.md) for completion, storage, error codes, and debugging.

The example has its own solution and uses no external packages. It is separate from LearningPack.slnx. Its five projects make dependency rules visible for study; a tiny application can start with fewer projects.

## What to keep beside your editor

- [Visual maps](Visual-Maps.md): distinguish runtime calls from source-code dependencies.
- [Glossary](Glossary.md): translate unfamiliar terms into everyday language.
- [Templates](Templates/README.md): requirements, decisions, design, tests, and operations.
- [Sources](Sources.md): official documentation and an already included architecture PDF.

Use [the course style](../STYLE.md) and [the Git workflow](../Git-Workflow.md). Before an exercise, inspect git status, keep unrelated work separate, and stage only the architecture files you intend to save. Completing this track does not require publishing anything or installing cloud services.
