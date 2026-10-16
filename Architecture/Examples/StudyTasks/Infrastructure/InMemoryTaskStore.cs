using StudyTasks.Application;
using StudyTasks.Domain;

namespace StudyTasks.Infrastructure;

// Useful for experiments and tests; data lasts only for this object's lifetime.
public sealed class InMemoryTaskStore : ITaskStore {
  private StudyTask[] _tasks = [];

  public IReadOnlyList<StudyTask> Load() {
    return _tasks.ToArray();
  }

  public void Save(IReadOnlyList<StudyTask> tasks) {
    _tasks = tasks.ToArray();
  }
}
