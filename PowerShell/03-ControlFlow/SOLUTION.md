# 03-ControlFlow exercise solution

Count how many values in 10, 20, 30, 40 are at least 30. Expect 2.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
$count = 0
foreach ($duration in @(10, 20, 30, 40)) {
  if ($duration -ge 30) {
    $count++
  }
}
Write-Output "Long sessions: $count"
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
