# 07-Classes exercise solution

Add a CompletedAt property and set it when Complete is called. Preserve the first completion time if Complete is called again.

## Suggested change

Add the property in StudySession.cs and replace that file's existing Complete method.

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
public DateTimeOffset? CompletedAt { get; private set; }

public void Complete() {
  CompletedAt ??= DateTimeOffset.UtcNow;
  IsComplete = true;
}
// Replace the existing Complete method inside StudySession.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
