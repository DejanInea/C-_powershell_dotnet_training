using System.Text.Json;
string path = Path.Combine(AppContext.BaseDirectory, "settings.json");
var settings = JsonSerializer.Deserialize<StudySettings>(File.ReadAllText(path))
    ?? throw new InvalidDataException("Settings cannot be null.");
string? overrideValue = Environment.GetEnvironmentVariable("TRAINING_DAILY_MINUTES");
int dailyMinutes = settings.DailyMinutes;
if (overrideValue is not null && !int.TryParse(overrideValue, out dailyMinutes)) {
  throw new InvalidDataException("TRAINING_DAILY_MINUTES must be a whole number.");
}

if (dailyMinutes is < 1 or > 180) {
  throw new InvalidDataException("DailyMinutes must be between 1 and 180.");
}

Console.WriteLine($"Course: {settings.Course}; daily target: {dailyMinutes} minutes");
