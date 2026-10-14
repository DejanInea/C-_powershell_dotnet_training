# 04-Objects exercise solution

Create a second object and export both to JSON in the console. Confirm it contains property names.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
$second = [pscustomobject]@{
  Topic = 'C#'
  Minutes = 20
  Complete = $false
}
@($session, $second) | ConvertTo-Json -Depth 3
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
