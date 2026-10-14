# 08-Testing exercise solution

Introduce a deliberate bug in StudyBudget, run the tests, confirm failure, then restore the correct rule.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
# From the repository root:
dotnet run --project .\DotNet10\08-Testing
$testExit = $LASTEXITCODE
Write-Output "Test exit: $testExit"
# Restore the library before moving on. A successful run exits 0.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
