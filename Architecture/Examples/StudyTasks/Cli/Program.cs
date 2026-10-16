using System.Text.Json;
using StudyTasks.Application;
using StudyTasks.Infrastructure;

if (args.Length == 0) {
  return Usage();
}

try {
  string dataPath = Environment.GetEnvironmentVariable("ARCHITECTURE_TASKS_PATH")
      ?? Path.Combine(AppContext.BaseDirectory, "output", "tasks.json");

  // Composition root: choose concrete adapters here, outside the business rules.
  var store = new JsonTaskStore(dataPath);
  var service = new TaskService(store);
  Console.Error.WriteLine($"Data: {Path.GetFullPath(dataPath)}");

  switch (args[0].ToLowerInvariant()) {
    case "add" when args.Length == 2:
      var added = service.Add(args[1]);
      Console.WriteLine($"Added {added.Id}: {added.Title}");
      return 0;
    case "list" when args.Length == 1:
      var tasks = service.List();
      if (tasks.Count == 0) {
        Console.WriteLine("No tasks.");
      }
      foreach (var task in tasks) {
        string status = task.IsComplete ? "done" : "todo";
        Console.WriteLine($"[{status}] {task.Id}: {task.Title}");
      }
      return 0;
    case "complete" when args.Length == 2 && Guid.TryParse(args[1], out Guid id):
      var completed = service.Complete(id);
      Console.WriteLine($"Completed {completed.Id}: {completed.Title}");
      return 0;
    default:
      return Usage();
  }
} catch (ArgumentException error) {
  Console.Error.WriteLine($"Invalid input or configuration: {error.Message}");
  return 2;
} catch (KeyNotFoundException error) {
  Console.Error.WriteLine(error.Message);
  return 3;
} catch (Exception error) when (
    error is IOException or UnauthorizedAccessException or JsonException) {
  Console.Error.WriteLine($"Storage failure: {error.Message}");
  return 1;
}

static int Usage() {
  Console.Error.WriteLine("Usage: add \"title\" | list | complete <task-guid>");
  return 2;
}
