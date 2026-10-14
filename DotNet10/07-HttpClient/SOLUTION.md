# 07-HttpClient exercise solution

Stop the server, run the client, and inspect LASTEXITCODE. Restart the server and verify success.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
dotnet run --project .\DotNet10\07-HttpClient -- http://127.0.0.1:5081
Write-Output "Exit code: $LASTEXITCODE"
# First try with the server stopped, then with it running.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
