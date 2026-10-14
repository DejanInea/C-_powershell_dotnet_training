# 10-Capstone exercise solution

Add an endpoint that returns total and completed task counts. Extend the root API smoke checks to verify it.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
app.MapGet("/tasks/summary", (TaskRepository repository) => {
  var tasks = repository.GetAll();
  return Results.Ok(new { Total = tasks.Count, Completed = tasks.Count(t => t.IsComplete) });
});
// Insert before app.Run(). The literal summary route does not match {id:int}.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
