# 02-Variables exercise solution

Add a Goal field of 60 minutes to the hashtable and print the remaining minutes.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
$plan.Goal = 60
Write-Output "Remaining: $($plan.Goal - $plan.Minutes) minutes"
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
