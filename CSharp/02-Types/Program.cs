using System.Globalization;

// Use decimal for monetary examples, and invariant formatting for predictable output.
const string course = "C#";
const int completed = 3;
const decimal price = 12.50m;
const bool isBeginner = true;
const double ratio = (double)completed / 12;
Console.WriteLine($"{course}: {completed} lessons; beginner={isBeginner}");
Console.WriteLine($"Total: {(price * 2).ToString("F2", CultureInfo.InvariantCulture)} EUR");
Console.WriteLine($"Progress: {ratio.ToString("P0", CultureInfo.InvariantCulture)}");

// Calculate the price after a 20% discount and print 10.00 EUR.
/*
0.2    // double
0.2m   // decimal
0.2f   // float
*/
const decimal discount = 0.2m;
const decimal discountPrice = price - (price * discount);
Console.WriteLine($"Discounted price: {discountPrice.ToString("F2", CultureInfo.InvariantCulture)} EUR");
