using System.Text.Json;
using StudyTasks.Application;
using StudyTasks.Domain;

namespace StudyTasks.Infrastructure;

// Single-writer teaching adapter: whole-file writes are not crash-safe or transactional.
public sealed class JsonTaskStore : ITaskStore {
  private readonly string _path;

  public JsonTaskStore(string path) {
    ArgumentException.ThrowIfNullOrWhiteSpace(path);
    _path = Path.GetFullPath(path);
  }

  public IReadOnlyList<StudyTask> Load() {
    string json;
    try {
      json = File.ReadAllText(_path);
    } catch (FileNotFoundException) {
      return [];
    } catch (DirectoryNotFoundException) {
      return [];
    }

    StoredTask[] rows = JsonSerializer.Deserialize<StoredTask[]>(json)
        ?? throw new InvalidDataException("Expected a JSON task array, not null.");
    var tasks = new List<StudyTask>();
    var ids = new HashSet<Guid>();
    foreach (StoredTask row in rows) {
      if (row is null || row.Title is null) {
        throw new InvalidDataException("A stored task or title is null.");
      }
      if (!ids.Add(row.Id)) {
        throw new InvalidDataException("The data contains duplicate task IDs.");
      }
      try {
        tasks.Add(new StudyTask(row.Id, row.Title, row.IsComplete));
      } catch (ArgumentException error) {
        throw new InvalidDataException("A stored task violates the domain rules.", error);
      }
    }
    return tasks;
  }

  public void Save(IReadOnlyList<StudyTask> tasks) {
    var rows = tasks.Select(task => new StoredTask(task.Id, task.Title, task.IsComplete));
    string json = JsonSerializer.Serialize(rows,
        new JsonSerializerOptions { WriteIndented = true });
    Directory.CreateDirectory(Path.GetDirectoryName(_path)!);
    // Report IO failures to the caller. A real multiuser store needs stronger guarantees.
    File.WriteAllText(_path, json);
  }
}
