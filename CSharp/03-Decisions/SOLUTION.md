# 03-Decisions exercise solution

Add a senior category for ages 65 and above. Check ages 12, 13, 17, 18, 64, 65, -1 and abc.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
string category = age switch {
  < 13 => "child",
  < 18 => "teenager",
  >= 65 => "senior",
  _ => "adult"
};
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
