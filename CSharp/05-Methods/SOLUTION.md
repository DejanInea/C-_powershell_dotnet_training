# 05-Methods exercise solution

Write CalculateTotal(price, quantity). Reject negative prices and quantities below one. Verify 5 times 3 equals 15.

## Suggested change

Apply this snippet in the location described by the lesson or the comments. If it replaces a method or variable declaration, remove the original definition first.

```csharp
static decimal CalculateTotal(decimal price, int quantity) {
  if (price < 0) {
    throw new ArgumentOutOfRangeException(nameof(price));
  }

  if (quantity < 1) {
    throw new ArgumentOutOfRangeException(nameof(quantity));
  }

  return price * quantity;
}
// Call from the top-level section: Console.WriteLine(CalculateTotal(5m, 3));
```

## Verify

Run the lesson again using its README commands. Check the exercise's stated result and one boundary or invalid case. An error for invalid input can be the correct result; explain why before continuing.

Write one sentence in Progress.md describing why the change works.
