# 04-DependencyInjection exercise solution

Resolve IGoalService twice and check ReferenceEquals. Change its registration to AddTransient and repeat.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
var first = provider.GetRequiredService<IGoalService>();
var second = provider.GetRequiredService<IGoalService>();
Console.WriteLine(ReferenceEquals(first, second));
// Singleton: True. After changing to AddTransient: False.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
