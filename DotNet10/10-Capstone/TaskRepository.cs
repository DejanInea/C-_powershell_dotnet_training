using System.Text.Json;

namespace LearningTasks;

public sealed class TaskRepository {
  private static readonly JsonSerializerOptions _jsonOptions = new() { WriteIndented = true };
  private readonly object _gate = new();
  private readonly string _path;
  private List<StudyTask> _tasks;
  private int _nextId;

  public TaskRepository(string path) {
    _path = Path.GetFullPath(path);
    if (File.Exists(_path)) {
      var stored = JsonSerializer.Deserialize<StoredTasks>(File.ReadAllText(_path))
          ?? throw new InvalidDataException("Task storage cannot be null.");
      if (stored.Tasks is null || stored.NextId < 1
          || stored.Tasks.Any(task => task is null || task.Id < 1
              || !TaskRules.IsValidTitle(task.Title))
          || stored.Tasks.Select(task => task.Id).Distinct().Count() != stored.Tasks.Count
          || stored.Tasks.Any(task => task.Id >= stored.NextId)) {
        throw new InvalidDataException("Task storage is invalid.");
      }
      _tasks = stored.Tasks;
      _nextId = stored.NextId;
    } else {
      _tasks = [];
      _nextId = 1;
    }
  }

  public IReadOnlyList<StudyTask> GetAll() {
    lock (_gate) {
      return _tasks.ToArray();
    }
  }

  public StudyTask Add(string title) {
    if (!TaskRules.IsValidTitle(title)) {
      throw new ArgumentException("Invalid title.", nameof(title));
    }
    lock (_gate) {
      int followingId = checked(_nextId + 1);
      var task = new StudyTask(_nextId, title.Trim(), false);
      List<StudyTask> candidate = [.. _tasks, task];
      Save(candidate, followingId);
      _tasks = candidate;
      _nextId = followingId;
      return task;
    }
  }

  public StudyTask? Complete(int id) {
    lock (_gate) {
      int index = _tasks.FindIndex(task => task.Id == id);
      if (index < 0) {
        return null;
      }
      var updated = _tasks[index] with {
        IsComplete = true
      };
      var candidate = _tasks.ToList();
      candidate[index] = updated;
      Save(candidate, _nextId);
      _tasks = candidate;
      return updated;
    }
  }

  public bool Delete(int id) {
    lock (_gate) {
      var candidate = _tasks.Where(task => task.Id != id).ToList();
      if (candidate.Count == _tasks.Count) {
        return false;
      }
      Save(candidate, _nextId);
      _tasks = candidate;
      return true;
    }
  }

  private void Save(List<StudyTask> candidate, int followingId) {
    Directory.CreateDirectory(Path.GetDirectoryName(_path)!);
    string temp = _path + ".tmp";
    var snapshot = new StoredTasks(followingId, candidate);
    File.WriteAllText(temp, JsonSerializer.Serialize(snapshot, _jsonOptions));
    File.Move(temp, _path, overwrite: true);
  }
}
