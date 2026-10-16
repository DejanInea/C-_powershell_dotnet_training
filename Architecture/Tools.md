# Programs to use, and when

Start with your existing editor, the .NET 10 SDK, PowerShell, Git, and paper. Extra tools become useful when you have a concrete problem for them to solve. This guide does not install software.

## Essential tools

| Job | Recommended starting tool | First practical action |
| --- | --- | --- |
| Write and debug C# | Your current IDE, or [Visual Studio Code](https://code.visualstudio.com/docs/csharp/get-started) with Microsoft's C# tooling | Open StudyTasks.slnx; set a breakpoint in TaskService.Add |
| Compile and run | [.NET 10 SDK](https://dotnet.microsoft.com/download/dotnet/10.0) | Run dotnet --info, then build the example |
| Run commands | Your existing PowerShell terminal | Run the commands in the example README |
| Keep history | [Git](https://git-scm.com/doc) | Inspect git diff before saving a focused change |
| Draw your first design | Paper, then [draw.io](https://www.drawio.com/) | Draw person -> program -> data file; label arrows |
| Read these lessons | IDE Markdown preview or a browser for SVG diagrams | Open README.md and a diagram beside the code |

Use the official VS Code setup guide if you choose VS Code. C# Dev Kit is an optional richer environment; review its current sign-in and license requirements for your use. The dotnet commands in this track work independently of an editor extension.

In draw.io's browser editor choose local/device storage for a local diagram, save an editable .drawio file, and export SVG when you want an easy-to-open picture. There is also a desktop version. See the [official site](https://www.drawio.com/).

## Helpful after the basics

| Tool | When it helps | Do this before adopting it |
| --- | --- | --- |
| [Mermaid](https://mermaid.js.org/intro/) | Keep a diagram as readable text in Git | Try the snippets in Visual-Maps.md in the official live editor |
| [DB Browser for SQLite](https://sqlitebrowser.org/) | Inspect tables when you add a SQLite database | Learn keys, constraints, and transactions first |
| [GitHub Actions](https://docs.github.com/en/actions/get-started/understand-github-actions) | Automatically build and check changes | Make the same commands pass locally |
| [Docker](https://docs.docker.com/get-started/) | Package an app and its runtime environment | Publish and run an ordinary local release first |

SQLite is a possible later persistence choice, not a requirement for the supplied JSON example. Database libraries and test frameworks generally require NuGet packages. This repository intentionally clears external package sources in NuGet.Config. Explore those packages in a separate practice workspace with deliberate package-source configuration; the supplied example needs none.

## Debugging exercise

1. Open Examples/StudyTasks/StudyTasks.slnx in your IDE.
2. Choose the Cli project and supply arguments: add "Trace this request".
3. Set a breakpoint in Application/TaskService.cs inside Add.
4. Step into Domain/StudyTask.cs, then Infrastructure/JsonTaskStore.cs.
5. Inspect the Call Stack and variables. Distinguish your task data from storage configuration.
6. Repeat with add "   ". Explain why storage is never written.

Editor menus vary; use your IDE's launch-argument configuration. You can still explore files and run the CLI entirely from the terminal.

Choose a tool because it answers a question. A box-and-arrow sketch plus a working debugger is enough to begin architecture.
