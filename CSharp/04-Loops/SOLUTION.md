# 04-Loops exercise solution

Print the average session length and count sessions of at least 20 minutes using foreach.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
int longSessions = 0;
foreach (int duration in minutes) {
  if (duration >= 20) {
    longSessions++;
  }
}

Console.WriteLine($"Average: {(double)total / minutes.Length}");
Console.WriteLine($"Long sessions: {longSessions}");
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
