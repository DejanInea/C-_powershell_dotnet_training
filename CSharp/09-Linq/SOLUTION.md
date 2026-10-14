# 09-Linq exercise solution

Find the average session length and create a list of distinct topic names. Expect 27.5 minutes and three topics.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
Console.WriteLine(sessions.Average(s => s.Minutes));
var names = sessions.Select(s => s.Topic).Distinct().ToList();
Console.WriteLine($"Topics: {names.Count}");
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
