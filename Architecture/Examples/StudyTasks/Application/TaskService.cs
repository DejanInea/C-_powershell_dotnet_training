using StudyTasks.Domain;

namespace StudyTasks.Application;

public sealed class TaskService {
  private readonly ITaskStore _store;

  public TaskService(ITaskStore store) {
    ArgumentNullException.ThrowIfNull(store);
    _store = store;
  }

  public StudyTask Add(string title) {
    // Validate before reading or writing storage.
    var task = StudyTask.Create(title);
    var tasks = _store.Load().ToList();
    tasks.Add(task);
    _store.Save(tasks);
    return task;
  }

  public IReadOnlyList<StudyTask> List() {
    return _store.Load();
  }

  public StudyTask Complete(Guid id) {
    var tasks = _store.Load().ToList();
    int index = tasks.FindIndex(task => task.Id == id);
    if (index < 0) {
      throw new KeyNotFoundException("No task has that ID.");
    }

    StudyTask completed = tasks[index].Complete();
    tasks[index] = completed;
    _store.Save(tasks);
    return completed;
  }
}
