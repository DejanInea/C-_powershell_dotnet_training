# PowerShell learning track

10 lessons, ordered from easy to hard. Read [PowerShell-Learning-Guide.pdf](PowerShell-Learning-Guide.pdf) for the complete printable course, or use the individual lesson files below.

Learn the shell alongside C#. The core scripts use syntax compatible with Windows PowerShell 5.1 and PowerShell 7. Windows PowerShell 5.1 runs on .NET Framework; installing the .NET 10 SDK does not upgrade that shell. PowerShell 7 runs as pwsh and is the recommended modern shell. Optional installation: winget install --id Microsoft.PowerShell --source winget. Open a new terminal and run pwsh afterward.

## Before lesson 01

1. Open a PowerShell terminal at the repository root, the folder containing LearningPack.slnx.
2. If local scripts are blocked, run `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass` for this terminal. This changes only this process, not the machine policy.
3. Run `. .\Initialize-Training.ps1` (there is a space between the first and second dots).
4. Keep the terminal at the repository root when copying commands from lessons.
5. For every lesson: predict the output, run it, read each statement, change one thing, complete the exercise, then check SOLUTION.md.

## Lesson order

1. [01-Commands: Commands, help, and discovery](01-Commands/README.md)
2. [02-Variables: Variables, strings, and collections](02-Variables/README.md)
3. [03-ControlFlow: Conditions and loops](03-ControlFlow/README.md)
4. [04-Objects: Objects and properties](04-Objects/README.md)
5. [05-Pipeline: Filtering, sorting, and measuring](05-Pipeline/README.md)
6. [06-Functions: Functions and pipeline parameters](06-Functions/README.md)
7. [07-Files: CSV, JSON, paths, and WhatIf](07-Files/README.md)
8. [08-Errors: Errors and external process exit codes](08-Errors/README.md)
9. [09-Modules: Reusable modules and reporting](09-Modules/README.md)
10. [10-Capstone: Control the .NET task API](10-Capstone/README.md)

## How to know you are ready to move on

Explain the example without reading the notes. Complete the exercise without copying the solution. Make one valid change and one invalid-input experiment. Record what happened in [Progress.md](Progress.md). If you cannot explain a result, repeat the lesson with smaller values.

## Learn Git with this track

Read [the Git workflow](../Git-Workflow.md) and [this track's Git checkpoints](Git-Practice.md). Each lesson includes a branch name, verification step, staging paths, and suggested commit. The printable course guide includes the shared Git workflow too.

## Official PDF references

The [Official-References index](Official-References/README.md) lists downloaded publisher PDFs and printable copies of current Microsoft documentation, with source URLs, editions, and course mappings. Publisher PDFs retain their original content. Documentation exports are clearly labeled as local print copies, rather than Microsoft-published PDF books.

## Reference documentation

The lesson guides are original teaching material. Official downloads and documentation exports are listed in Official-References/README.md. The links below provide further online study. Checked on 14 October 2026.

- [PowerShell documentation](https://learn.microsoft.com/en-us/powershell/)
- [Install PowerShell on Windows](https://learn.microsoft.com/en-us/powershell/scripting/install/install-powershell-on-windows)
- [Pipeline concepts](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_pipelines)
- [Advanced functions](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_functions_advanced)
