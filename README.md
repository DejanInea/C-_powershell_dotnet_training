# Learn C#, PowerShell, and .NET 10

A hands-on course with **32 lessons**, runnable code, exercises, solutions, progress checklists, and three original PDF guides.

## Three learning folders

| Topic | Lessons | Start here | Printable guide |
| --- | --- | --- | --- |
| C# | 12 | [CSharp/README.md](CSharp/README.md) | [C# PDF](CSharp/CSharp-Learning-Guide.pdf) |
| PowerShell | 10 | [PowerShell/README.md](PowerShell/README.md) | [PowerShell PDF](PowerShell/PowerShell-Learning-Guide.pdf) |
| .NET 10 | 10 | [DotNet10/README.md](DotNet10/README.md) | [.NET 10 PDF](DotNet10/DotNet10-Learning-Guide.pdf) |

C# is a programming language. PowerShell is a shell and scripting language. .NET 10 is the SDK, runtime, and library platform used by the C# projects. Each folder contains numbered lessons with source files, step-by-step instructions, expected output, exercises, and SOLUTION.md files. PDFs include complete code listings and solutions. Editable Markdown and HTML guides sit beside the PDFs.

## Start in five minutes

Open a PowerShell terminal at the repository root. The .NET 10 SDK was already installed when this pack was prepared, along with Windows PowerShell 5.1. The core scripts work in 5.1 and 7. You can edit source files with any text editor.

If local scripts are blocked, enable them for this terminal process only:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

Initialize the terminal and run the first examples:

```powershell
# The first dot is followed by a space: this keeps setup in your current terminal.
. .\Initialize-Training.ps1
dotnet run --project .\CSharp\01-Hello -- Dejan
.\PowerShell\01-Commands\Demo.ps1
```

The C# example prints:

```text
Hello, C#!
Welcome, Dejan!
```

Open [C# lesson 01](CSharp/01-Hello/README.md), attempt its exercise, then read its solution. Run lesson commands from the repository root unless instructed otherwise.

## Code style

Authored examples use [Google's C# style guide](https://google.github.io/styleguide/csharpguide.html), with formatting settings in .editorconfig. [STYLE.md](STYLE.md) explains the C# rules and the matching PowerShell course convention. Run `Check-Style.ps1` before committing. Classes and records have named source files, and solution snippets follow the same formatting. The PDFs include this guidance.

## Git practice and official references

Use [Git-Workflow.md](Git-Workflow.md) for branches, staging, commit messages, pushing, pull requests, merging, synchronization, conflicts, and undoing mistakes. Every lesson now includes a Git checkpoint; every course PDF includes the workflow. Run `New-GitPractice.ps1 -Topic CSharp`, `-Topic PowerShell`, or `-Topic DotNet10` to create an isolated local Git lab with two clones and a bare remote.

Each topic's Official-References folder contains original publisher PDFs and clearly attributed print exports of current Microsoft documentation. See the indexes in [CSharp](CSharp/Official-References/README.md), [PowerShell](PowerShell/Official-References/README.md), and [DotNet10](DotNet10/Official-References/README.md). Older standards and architecture books are labeled by edition; current C# 14 and .NET 10 articles are provided separately. `Download-OfficialReferences.ps1` refreshes these files from the source manifest and records SHA-256 hashes.

[Git/Official-References](Git/Official-References/README.md) contains the Pro Git second-edition book linked by Git's official site and GitHub's official Git cheat sheet. Refresh just these original PDFs with `Download-OfficialReferences.ps1 -Topic Git`; this download needs no browser.

## Eight-week study plan

Plan four sessions of 45-60 minutes per week. Allow extra time for advanced exercises and repeat lessons when needed.

| Week | Lessons | Skills |
| --- | --- | --- |
| 1 | C# 01-03; PowerShell 01-02 | Run code, variables, input validation |
| 2 | C# 04-06; PowerShell 03-05 | Loops, collections, object pipelines |
| 3 | C# 07-08; PowerShell 06 | Classes, interfaces, reusable functions |
| 4 | C# 09-10; PowerShell 07-08 | Queries, files, error handling |
| 5 | C# 11-12; PowerShell 09 | Async, persistent tracker, modules |
| 6 | .NET 10 01-04 | SDK, libraries, configuration, services |
| 7 | .NET 10 05-08 | APIs, request validation, clients, testing |
| 8 | .NET 10 09-10; PowerShell 10 | Publishing and a combined task project |

For each lesson: predict, run, explain, change, exercise, compare with the solution. Record progress in the topic's Progress.md. The final lessons are advanced within this beginner course. Databases, identity, cloud deployment, and distributed systems are further study.

## Build and verify

LearningPack.slnx contains all 22 .NET projects. Open it in an editor or use:

```powershell
. .\Initialize-Training.ps1
dotnet build .\LearningPack.slnx -m:1 -nr:false
.\Test-LearningPack.ps1
```

The verification script builds projects, runs console and PowerShell examples, checks domain rules and storage, starts API servers on temporary loopback ports, checks HTTP responses and the PowerShell client, and publishes a console app locally. It stops the server processes it starts. API logs and isolated test data go into .artifacts; demonstration data goes into lesson output folders. No administrator access is needed. Exercise changes can alter expected output; the checks verify the supplied baseline.

The testing lesson is an executable harness: use `dotnet run --project .\DotNet10\08-Testing` rather than `dotnet test`.

NuGet.Config clears external package sources because these projects use the installed SDK and shared frameworks. If you later add external packages, intentionally configure their package source. Setup keeps the SDK's user cache inside .tools and changes environment variables only in your terminal. global.json selects a .NET 10 SDK and allows newer .NET 10 feature bands.

## Final project: combine all three topics

Terminal 1:

```powershell
. .\Initialize-Training.ps1
dotnet run --project .\DotNet10\10-Capstone -- --urls http://127.0.0.1:5080
```

Terminal 2, also at the repository root:

```powershell
$task = .\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Complete my learning project'
.\PowerShell\10-Capstone\Demo.ps1 -Action Complete -Id $task.id -WhatIf
.\PowerShell\10-Capstone\Demo.ps1 -Action Complete -Id $task.id
.\PowerShell\10-Capstone\Demo.ps1 -Action List
```

Stop the server with Ctrl+C. Its default data file is DotNet10/10-Capstone/bin/Debug/net10.0/output/tasks.json. Supply `--TrainingDataPath C:\path\tasks.json` to choose an absolute data path; reuse the same path to preserve tasks. The server is a local teaching application with a single-process JSON store.

## Troubleshooting

- dotnet missing: install the [.NET 10 SDK](https://dotnet.microsoft.com/download/dotnet/10.0) and open a new terminal. A runtime alone cannot compile.
- Scripts blocked: use the process-only policy command above; organizational machine policies still apply.
- SDK cache permission error: dot-source Initialize-Training.ps1 before dotnet.
- Solution build fails without a clear error: use `-m:1 -nr:false`.
- API connection refused: start the server in another terminal and use its port.
- Port occupied: choose another loopback port and give the client the same address with -BaseUri.
- Compiler error after editing: read the first error's file and line, check braces and types, and compare with the lesson solution.
- PowerShell 7 optional install: `winget install --id Microsoft.PowerShell --source winget`, then open a new terminal and run `pwsh`. Installing the .NET SDK does not upgrade Windows PowerShell.

## Regenerate the PDF guides

```powershell
.\Build-Guides.ps1
```

This creates Markdown, HTML, and PDF copies from current lesson files using local Chrome or Edge in headless mode, with its profile inside .tools. It needs no PDF service or account. Official Microsoft references are listed in each track, including [.NET 10](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-10/overview), [C# 14](https://learn.microsoft.com/en-us/dotnet/csharp/whats-new/csharp-14), and [PowerShell installation](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows). Checked on 14 October 2026. These are original teaching guides, not downloaded third-party books.
