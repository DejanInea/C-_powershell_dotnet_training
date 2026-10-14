var topics = new List<string> { "C#", "PowerShell" };
topics.Add(".NET 10");
foreach (string topic in topics) {
  Console.WriteLine(topic);
}

var minutesByTopic = new Dictionary<string, int> {
  ["C#"] = 45,
  ["PowerShell"] = 30
};
if (minutesByTopic.TryGetValue("C#", out int minutes)) {
  Console.WriteLine($"C#: {minutes} minutes");
}

string? optionalNote = null;
Console.WriteLine($"Note: {optionalNote ?? "No note yet"}");
