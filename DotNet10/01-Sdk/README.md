# 01-Sdk: The SDK, runtime, and command line

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn understanding the platform and project lifecycle. Complete the setup in the track README.

## Understand the idea

C# is a language. .NET is a platform containing a runtime and libraries. The SDK includes tools to create, build, and publish applications. A runtime installation alone cannot compile your code. A .csproj is an XML project definition. TargetFramework net10.0 selects .NET 10; the SDK supplies the matching C# compiler. dotnet restore resolves dependencies, build compiles, and run starts an application. Build output is placed in bin; intermediate files appear in obj. This course disables external package sources because its projects only use the installed SDK and shared frameworks. .NET 10 also supports file-based C# apps, demonstrated in Hello.cs.

## Step by step

Hello.cs uses .NET 10 file-based property directives to disable Native AOT and self-contained output. This keeps the example runnable with the installed SDK and runtime, without downloading additional compiler or runtime packs.

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet --info
dotnet build .\DotNet10\01-Sdk
dotnet run --project .\DotNet10\01-Sdk
dotnet run --file .\DotNet10\01-Sdk\Hello.cs
```

## Expected result

```text
The project prints .NET major version: 10 and the SDK/runtime explanation. The file-based app prints Hello from a .NET 10 file-based app!
```

## Exercise

Inspect the csproj and identify TargetFramework, Nullable, and ImplicitUsings. Create a separate scratch console project under this lesson's output folder.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Set DOTNET_CLI_HOME locally if the SDK cannot access its user cache.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-01-sdk-notes.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-01-sdk-notes
# Implement the exercise, then verify:
dotnet run --project .\DotNet10\01-Sdk
git diff -- DotNet10/01-Sdk/README.md DotNet10/01-Sdk/Program.cs
git add -- DotNet10/01-Sdk/README.md DotNet10/01-Sdk/Program.cs
git diff --cached
git diff --cached --check
git commit -m "docs(dotnet10): explain project SDK settings"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-01-sdk-notes`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
