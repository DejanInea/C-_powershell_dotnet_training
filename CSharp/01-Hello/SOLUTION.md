# 01-Hello exercise solution

Add a second argument for your city. If it is missing, use Ljubljana. Print a third line: City: Ljubljana.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
string city = args.Length > 1 ? args[1] : "Ljubljana";
Console.WriteLine($"City: {city}");
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
