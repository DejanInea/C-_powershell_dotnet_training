Console.WriteLine($"10 + 5 = {Add(10, 5)}");
Console.WriteLine($"20% of 50 = {Percentage(50m, 20m)}");
Console.WriteLine($"Valid duration: {IsValidDuration(30)}");

// Parameters are inputs; the return type describes the output.
static int Add(int left, int right) {
  return left + right;
}

static decimal Percentage(decimal value, decimal percent) {
  return value * percent / 100m;
}

static bool IsValidDuration(int minutes) {
  return minutes > 0 && minutes <= 180;
}
