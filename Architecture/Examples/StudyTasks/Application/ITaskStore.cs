using StudyTasks.Domain;

namespace StudyTasks.Application;

// A teaching contract for a small, single-writer collection.
// These separate Load/Save calls do not form a transaction.
public interface ITaskStore {
  IReadOnlyList<StudyTask> Load();
  void Save(IReadOnlyList<StudyTask> tasks);
}
