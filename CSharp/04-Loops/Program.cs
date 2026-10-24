// Set an array of integers
int[] minutes = [15, 20, 25];

// integer value of total minutes
int total = 0;

// Do a loop to increase total minutes by each value in the array and print the session number and minutes for that session.
for (int index = 0; index < minutes.Length; index++) {
  Console.WriteLine($"Session {index + 1}: {minutes[index]} minutes");
  total += minutes[index];
}
Console.WriteLine($"Total: {total} minutes");
int remaining = 2;
while (remaining > 0) {
  Console.WriteLine($"Practice rounds left: {remaining}");
  remaining--;
}

// Exercise: Print the average session length and count sessions of at least 20 minutes using foreach.
int[] sessionLengths = [15, 20, 25, 30, 35];
int sum = 0;

for (int i=0; i < sessionLengths.Length; i++) {
  sum += sessionLengths[i];
}

double average = (double)sum / sessionLengths.Length;
Console.WriteLine($"Average session length: {average} minutes");


/* Write CalculateTotal(price, quantity). Reject negative prices and quantities below one. 
  Verify 5 times 3 equals 15.
  Work in this lesson's source file. For multiple experiments, copy the example into this 
  lesson's output directory rather than changing later lessons. Rebuild after C# edits.

  Use ArgumentOutOfRangeException for invalid parameters.
*/


double price = 5.5;
int quantity = 3;
try {
  double totalPrice = Calculator.CalculateTotal(price, quantity);
  Console.WriteLine($"Total price for {quantity} items and price {price} is {totalPrice}");
} catch (ArgumentOutOfRangeException ex) {
  Console.WriteLine($"Error: {ex.ParamName} - {ex.Message}");
}

// Test of the first method
class Calculator {
  static void sayHello() {
    Console.WriteLine("Hello, World!");
  }
  public static double CalculateTotal(double price, int quantity) {
    // Check if price is a number and not negative
    if (price < 0) {
      throw new ArgumentOutOfRangeException("price", "Price cannot be negative.");
    }
    // Chheck if quantitive is below 1
    if (quantity < 1) {
      throw new ArgumentOutOfRangeException("quantity", "Quantity must be at least 1.");
    }
    // return the total price
    return price * quantity;
  }
}
  