// Top-level statements are the entry point of this application.
// Ordinary output
Console.WriteLine("Hello, C#!");
// Create new string variable and put argument on it, if argument is empty use 'Learner' as constant

// string name declares a variable that holds text.
// args contains the command-line arguments passed to your program.
// args.Length > 0 checks whether at least one argument exists.
// ? args[0] uses the first argument when the check is true. Indexes start at 0.
// : "Learner" supplies the fallback when the check is false.

string name;

if (args.Length > 0) {
    name = args[0];
} else {
    name = "Learner";
}

// different one line approach
name = args.Length > 0 ? args[0] : "Learner";

Console.WriteLine($"Welcome, {name}!");

/*
Console.WriteLine("Hello, C#!");
string name = args.Length > 0 ? args[0] : "Learner";
Console.WriteLine($"Welcome, {name}!");
*/