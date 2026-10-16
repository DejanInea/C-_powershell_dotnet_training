using StudyTasks.Application;
using StudyTasks.Domain;

namespace StudyTasks.Checks;

// A fake that exposes side effects and can simulate a storage failure.
internal sealed class RecordingTaskStore : ITaskStore {
  private StudyTask[] _tasks = [];

  public int LoadCalls {
    get; private set;
  }
  public int SaveCalls {
    get; private set;
  }
  public bool FailOnSave {
    get; set;
  }

  public IReadOnlyList<StudyTask> Load() {
    LoadCalls++;
    return _tasks.ToArray();
  }

  public void Save(IReadOnlyList<StudyTask> tasks) {
    SaveCalls++;
    if (FailOnSave) {
      throw new IOException("Simulated storage failure.");
    }
    _tasks = tasks.ToArray();
  }
}
