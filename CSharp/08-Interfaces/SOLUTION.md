# 08-Interfaces exercise solution

Create a MemoryNotifier that stores messages in a List<string>. Call Finish twice and verify that it captured two messages.

## Suggested change

Create MemoryNotifier.cs in this lesson folder:

```csharp
public sealed class MemoryNotifier : INotifier {
  public List<string> Messages { get; } = [];

  public void Send(string message) {
    Messages.Add(message);
  }
}
```

Replace the top-level statements in Program.cs with:

```csharp
var memory = new MemoryNotifier();
var tracker = new StudyTracker(memory);
tracker.Finish("C#");
tracker.Finish("PowerShell");
Console.WriteLine(memory.Messages.Count);
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
