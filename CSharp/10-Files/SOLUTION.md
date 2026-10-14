# 10-Files exercise solution

Read a separate missing file inside a try block and show a friendly message. Do not delete the sample file.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
try {
  File.ReadAllText(Path.Combine(output, "missing.json"));
} catch (FileNotFoundException) {
  Console.WriteLine("No saved file exists yet.");
}
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
