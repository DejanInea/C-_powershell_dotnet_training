// Top-level statements are the entry point of this application.
// Ordinary output
using System.Security.Principal;

Console.WriteLine("Hello, C#!");
// Create new string variable and put argument on it, if argument is empty use 'Learner' as constant

// string name declares a variable that holds text.
// args contains the command-line arguments passed to your program.
// args.Length > 0 checks whether at least one argument exists.
// ? args[0] uses the first argument when the check is true. Indexes start at 0.
// : "Learner" supplies the fallback when the check is false.

string name;
string city;

if (args.Length > 0) {
    name = args[0];
} else {
    name = "Learner";
}

// Check if the args[1] exists and if it's string
if (args.Length > 1 && !string.IsNullOrWhiteSpace(args[1])) {
    city = args[1];
} else {
    city = "Ljubljana";
    Console.WriteLine("Second argument is missing or it's wrong value");
}

// different one line approach
name = args.Length > 0 ? args[0] : "Learner";
city = args.Length > 1 && !string.IsNullOrWhiteSpace(args[1]) ? args[1] : "Ljubljana";

Console.WriteLine($"Welcome, {name}!");


/*
Console.WriteLine("Hello, C#!");
string name = args.Length > 0 ? args[0] : "Learner";
Console.WriteLine($"Welcome, {name}!");
*/