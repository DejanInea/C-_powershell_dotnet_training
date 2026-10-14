# 07-Files exercise solution

Import the JSON file and print only topics with at least 25 minutes. Run WhatIf before making edits.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
Get-Content -LiteralPath $jsonPath -Raw | ConvertFrom-Json |
  Where-Object {
  $_.Minutes -ge 25
} |
  Select-Object -ExpandProperty Topic
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
