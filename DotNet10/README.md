# .NET 10 learning track

10 lessons, ordered from easy to hard. Read [DotNet10-Learning-Guide.pdf](DotNet10-Learning-Guide.pdf) for the complete printable course, or use the individual lesson files below.

Use this track after C# lessons 01 through 08 and PowerShell lessons 01 through 06. .NET is a platform rather than a separate programming language. This track teaches projects, libraries, configuration, dependency injection, APIs, clients, testing, and publishing. The projects target net10.0 and use installed SDK/shared-framework components without third-party packages.

## Before lesson 01

1. Open a PowerShell terminal at the repository root, the folder containing LearningPack.slnx.
2. If local scripts are blocked, run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` for this terminal. This changes only this process, not the machine policy.
3. Run `. .\Initialize-Training.ps1` (there is a space between the first and second dots).
4. Keep the terminal at the repository root when copying commands from lessons.
5. For every lesson: predict the output, run it, read each statement, change one thing, complete the exercise, then check SOLUTION.md.

## Lesson order

1. [01-Sdk: The SDK, runtime, and command line](01-Sdk/README.md)
2. [02-Library: A library and project references](02-Library/README.md)
3. [03-Configuration: JSON settings and environment variables](03-Configuration/README.md)
4. [04-DependencyInjection: Dependency injection and logging](04-DependencyInjection/README.md)
5. [05-MinimalApi: Your first HTTP API](05-MinimalApi/README.md)
6. [06-Validation: Validate request bodies and status codes](06-Validation/README.md)
7. [07-HttpClient: Call an API from C#](07-HttpClient/README.md)
8. [08-Testing: Executable checks and failure cases](08-Testing/README.md)
9. [09-Publishing: Release builds and framework-dependent publishing](09-Publishing/README.md)
10. [10-Capstone: A persistent task API](10-Capstone/README.md)

## How to know you are ready to move on

Explain the example without reading the notes. Complete the exercise without copying the solution. Make one valid change and one invalid-input experiment. Record what happened in [Progress.md](Progress.md). If you cannot explain a result, repeat the lesson with smaller values.

## Learn Git with this track

Read [the Git workflow](../Git-Workflow.md) and [this track's Git checkpoints](Git-Practice.md). Each lesson includes a branch name, verification step, staging paths, and suggested commit. The printable course guide includes the shared Git workflow too.

## Official PDF references

The [Official-References index](Official-References/README.md) lists downloaded publisher PDFs and printable copies of current Microsoft documentation, with source URLs, editions, and course mappings. Publisher PDFs retain their original content. Documentation exports are clearly labeled as local print copies, rather than Microsoft-published PDF books.

## Reference documentation

The lesson guides are original teaching material. Official downloads and documentation exports are listed in Official-References/README.md. The links below provide further online study. Checked on 14 October 2026.

- [.NET 10 overview](https://learn.microsoft.com/en-us/dotnet/core/whats-new/dotnet-10/overview)
- [Install .NET on Windows](https://learn.microsoft.com/en-us/dotnet/core/install/windows)
- [.NET CLI](https://learn.microsoft.com/en-us/dotnet/core/tools/)
- [File-based applications](https://learn.microsoft.com/en-us/dotnet/core/sdk/file-based-apps)
- [ASP.NET Core minimal APIs](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/minimal-apis?view=aspnetcore-10.0)
- [Dependency injection](https://learn.microsoft.com/en-us/dotnet/core/extensions/dependency-injection)
- [Publishing](https://learn.microsoft.com/en-us/dotnet/core/deploying/)
