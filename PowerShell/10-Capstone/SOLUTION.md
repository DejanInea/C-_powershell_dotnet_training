# 10-Capstone exercise solution

Preview completion with WhatIf, then complete a real task and verify IsComplete. Use the ID returned by Add.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
$task = .\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Practice APIs'
.\PowerShell\10-Capstone\Demo.ps1 -Action Complete -Id $task.id -WhatIf
.\PowerShell\10-Capstone\Demo.ps1 -Action Complete -Id $task.id
.\PowerShell\10-Capstone\Demo.ps1 -Action List
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
