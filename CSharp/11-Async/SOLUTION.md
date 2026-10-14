# 11-Async exercise solution

Change the timeout to 10 milliseconds. Predict what happens, then run it. Restore the timeout and explain the difference.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
using var cancellation = new CancellationTokenSource(TimeSpan.FromMilliseconds(10));
// Replace the original source declaration. Expected:
// Practice planning was cancelled.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
