# 08-Errors exercise solution

Call dotnet with an invalid subcommand, capture LASTEXITCODE immediately, and confirm it is nonzero. Handle that expected failure without failing the whole demo.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
& dotnet definitely-not-a-real-command
$commandExit = $LASTEXITCODE
if ($commandExit -eq 0) {
  throw 'Expected the invalid command to fail.'
}
Write-Output "Expected failure code: $commandExit"
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
