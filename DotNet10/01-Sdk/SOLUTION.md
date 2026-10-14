# 01-Sdk exercise solution

Inspect the csproj and identify TargetFramework, Nullable, and ImplicitUsings. Create a separate scratch console project under this lesson's output folder.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
New-Item -ItemType Directory -Path .\DotNet10\01-Sdk\output -Force | Out-Null
$env:DOTNET_CLI_HOME = Join-Path (Get-Location).Path '.tools\dotnet-home'
dotnet new console --framework net10.0 --output .\DotNet10\01-Sdk\output\Scratch
dotnet run --project .\DotNet10\01-Sdk\output\Scratch
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
