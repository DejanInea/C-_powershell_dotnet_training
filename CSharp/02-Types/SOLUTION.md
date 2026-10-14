# 02-Types exercise solution

Calculate the price after a 20% discount and print 10.00 EUR.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
decimal discounted = price * 0.80m;
Console.WriteLine($"{discounted.ToString("F2", CultureInfo.InvariantCulture)} EUR");
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
