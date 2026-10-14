int[] minutes = [15, 20, 25];
int total = 0;
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
