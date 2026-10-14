# 06-Collections exercise solution

Add .NET 10 with 60 minutes. Print a total of 135 minutes, using a loop over dictionary values.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
minutesByTopic[".NET 10"] = 60;
int total = 0;
foreach (int value in minutesByTopic.Values) {
  total += value;
}

Console.WriteLine($"Total: {total} minutes");
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
