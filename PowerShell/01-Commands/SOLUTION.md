# 01-Commands exercise solution

Find Get-Content, inspect its syntax, and list only files in this lesson folder.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
Get-Command Get-Content -Syntax
Get-ChildItem -LiteralPath $PSScriptRoot -File
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
