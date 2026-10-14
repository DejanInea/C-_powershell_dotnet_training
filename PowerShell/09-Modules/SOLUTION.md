# 09-Modules exercise solution

Add AverageMinutes to each summary object. Check C# gives 37.5.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```powershell
AverageMinutes = ($group.Group | Measure-Object -Property Minutes -Average).Average
# Add the property to the module's output hashtable.
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
