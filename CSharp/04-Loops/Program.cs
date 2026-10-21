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