# 05-MinimalApi exercise solution

Add GET /minutes/{count:int} returning hours. Return 400 for a negative count.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
app.MapGet("/minutes/{count:int}", (int count) =>
    count < 0
        ? Results.BadRequest(new { Error = "Count cannot be negative." })
        : Results.Ok(new { Hours = count / 60.0 }));
// Insert before app.Run().
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
