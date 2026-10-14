# 03-Configuration exercise solution

Run with a daily target of 45 using an environment variable. Restore its previous value afterward.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
$previousTarget = $env:TRAINING_DAILY_MINUTES
try {
  $env:TRAINING_DAILY_MINUTES = '45'
  dotnet run --project .\DotNet10\03-Configuration
} finally {
  $env:TRAINING_DAILY_MINUTES = $previousTarget
}
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
