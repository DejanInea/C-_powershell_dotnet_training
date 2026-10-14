// Accept input as an argument so this lesson also runs without a prompt.
string input = args.Length > 0 ? args[0] : "18";
if (!int.TryParse(input, out int age) || age < 0 || age > 130) {
  Console.WriteLine("Enter a whole-number age between 0 and 130.");
  return;
}
string category = age switch {
  < 13 => "child",
  < 18 => "teenager",
  _ => "adult"
};
Console.WriteLine($"Age {age}: {category}");
