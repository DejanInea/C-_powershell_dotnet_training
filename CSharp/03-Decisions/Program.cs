// Accept input as an argument so this lesson also runs without a prompt.
// if there is no argument use the default value of 18 else use the argument value.
string input = args.Length > 0 ? args[0] : "18";

// Check if the input is a valid integer and within the range of 0 to 130.
if (!int.TryParse(input, out int age) || age < 0 || age > 130) {
  Console.WriteLine("Enter a whole-number age between 0 and 130.");
  return;
}

// Use a switch expression to determine the category based on age.
string category = age switch {
  < 13 => "child",
  < 18 => "teenager",
  _ => "adult"
};

Console.WriteLine($"Age {age}: {category}");

// Exercise: Add a case for "senior" for ages 65 and above, and update the output message accordingly.
string inputnew = args.Length > 0 ? args[0] : "18";

// Check if the input is valid integer and within the range ob 0 to 130.
if (!int.TryParse(inputnew, out int agenew) || agenew < 0 || agenew > 130) {
  Console.WriteLine("Enter a whole-number age between 0 and 130.");
  return;
}

// Use a switch expression to determine the category based on age.
string categorynew = agenew switch {
  < 13 => "Child",
  < 18 => "Teenager",
  < 65 => "Adult",
  _ => "Senior"
};

Console.WriteLine($"Age {agenew}: {categorynew}");