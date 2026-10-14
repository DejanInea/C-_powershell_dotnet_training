using var cancellation = new CancellationTokenSource(TimeSpan.FromSeconds(2));
try {
  Task<int> first = PracticeAsync("C#", 30, cancellation.Token);
  Task<int> second = PracticeAsync("PowerShell", 20, cancellation.Token);
  int[] minutes = await Task.WhenAll(first, second);
  Console.WriteLine($"Planned minutes: {minutes.Sum()}");
} catch (OperationCanceledException) {
  Console.WriteLine("Practice planning was cancelled.");
}
static async Task<int> PracticeAsync(string topic, int minutes, CancellationToken token) {
  // Simulate waiting for I/O; async does not inherently create a new thread.
  await Task.Delay(100, token);
  Console.WriteLine($"Prepared: {topic}");
  return minutes;
}
