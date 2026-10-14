using System.Text.Json;

string folder = Path.GetFullPath(
    Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "output"));
Directory.CreateDirectory(folder);
string path = Path.Combine(folder, "study-log.json");
string command = args.Length == 0 ? "list" : args[0].ToLowerInvariant();
try {
  List<StudyEntry> entries = File.Exists(path)
      ? JsonSerializer.Deserialize<List<StudyEntry>>(File.ReadAllText(path))
          ?? throw new InvalidDataException("The log contained null.")
      : [];
  switch (command) {
    case "add" when args.Length == 3:
      if (!int.TryParse(args[2], out int minutes) || minutes < 1 || minutes > 180) {
        throw new ArgumentException("Minutes must be between 1 and 180.");
      }

      var entry = new StudyEntry(args[1], minutes);
      entries.Add(entry);
      // Write to a temporary sibling before replacing the saved file.
      string temp = path + ".tmp";
      var options = new JsonSerializerOptions { WriteIndented = true };
      File.WriteAllText(temp, JsonSerializer.Serialize(entries, options));
      File.Move(temp, path, overwrite: true);
      Console.WriteLine($"Added: {entry.Topic}, {entry.Minutes} minutes");
      break;
    case "list":
      foreach (var item in entries) {
        Console.WriteLine($"{item.Topic}: {item.Minutes} minutes");
      }

      Console.WriteLine($"Entries: {entries.Count}; total: {entries.Sum(e => e.Minutes)} minutes");
      break;
    default:
      throw new ArgumentException("Usage: list | add <topic> <minutes>");
  }
} catch (Exception error) when (
    error is IOException or JsonException or ArgumentException or InvalidDataException) {
  Console.Error.WriteLine(error.Message);
  Environment.ExitCode = 1;
}
