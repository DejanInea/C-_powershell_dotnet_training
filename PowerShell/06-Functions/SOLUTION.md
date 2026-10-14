# 06-Functions exercise solution

Add a Days property where one study day is eight hours. Verify 480 minutes produces Days=1.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
[pscustomobject]@{
  Minutes = $Minutes
  Hours = $Minutes / 60
  Days = $Minutes / 480
}
// Replace the output object inside process.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
