var sessions = new List<Session>
{
    new("C#", 30), new("PowerShell", 20), new("C#", 45), new(".NET 10", 15)
};
var longer = sessions.Where(s => s.Minutes >= 30).OrderByDescending(s => s.Minutes).ToList();
foreach (var session in longer) {
  Console.WriteLine($"{session.Topic}: {session.Minutes}");
}

Console.WriteLine($"Total: {sessions.Sum(s => s.Minutes)}");
foreach (var group in sessions.GroupBy(s => s.Topic).OrderBy(g => g.Key, StringComparer.Ordinal)) {
  Console.WriteLine($"{group.Key} total: {group.Sum(s => s.Minutes)}");
}
