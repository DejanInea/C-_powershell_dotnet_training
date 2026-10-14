# 09-Publishing exercise solution

Compare bin/Debug and the published output. Locate the DLL, runtimeconfig.json, and deps.json and explain each role.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
Get-ChildItem .\DotNet10\09-Publishing\output\published
Get-Content .\DotNet10\09-Publishing\output\published\DotNet10.01.Sdk.runtimeconfig.json
Get-Content .\DotNet10\09-Publishing\output\published\DotNet10.01.Sdk.deps.json
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
