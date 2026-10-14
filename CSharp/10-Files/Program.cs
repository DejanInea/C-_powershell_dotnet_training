using System.Text.Json;

// Output belongs to this lesson, regardless of the terminal's current directory.
string output = Path.GetFullPath(
    Path.Combine(AppContext.BaseDirectory, "..", "..", "..", "output"));
Directory.CreateDirectory(output);
string path = Path.Combine(output, "sessions.json");
var original = new List<Session> { new("C#", 30), new("PowerShell", 20) };
try {
  var options = new JsonSerializerOptions { WriteIndented = true };
  File.WriteAllText(path, JsonSerializer.Serialize(original, options));
  var loaded = JsonSerializer.Deserialize<List<Session>>(File.ReadAllText(path))
      ?? throw new InvalidDataException("The JSON contained null.");
  Console.WriteLine($"Saved and loaded {loaded.Count} sessions.");
} catch (IOException error) {
  Console.Error.WriteLine($"File error: {error.Message}");
  Environment.ExitCode = 1;
} catch (JsonException error) {
  Console.Error.WriteLine($"JSON error: {error.Message}");
  Environment.ExitCode = 1;
}
