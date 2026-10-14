# 12-Capstone exercise solution

Add a summary command that prints total minutes per topic. Verify invalid input never changes the saved file.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
  case "summary":
    foreach (var group in entries.GroupBy(e => e.Topic).OrderBy(g => g.Key)) {
      Console.WriteLine($"{group.Key}: {group.Sum(e => e.Minutes)} minutes");
    }

    break;
// Insert before default in the existing switch.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
