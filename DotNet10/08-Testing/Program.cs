using LearningTasks;
using StudyMath;

int failures = 0;
Check("budget multiplies", () => Equal(75, StudyBudget.TotalMinutes(3, 25)));
Check("goal boundary", () => Equal(true, StudyBudget.HasReachedGoal(60, 60)));
Check("negative sessions rejected",
    () => Throws<ArgumentOutOfRangeException>(() => StudyBudget.TotalMinutes(-1, 25)));
Check("overflow rejected",
    () => Throws<OverflowException>(() => StudyBudget.TotalMinutes(int.MaxValue, 2)));
Check("blank task rejected", () => Equal(false, TaskRules.IsValidTitle("   ")));
Check("long task rejected", () => Equal(false, TaskRules.IsValidTitle(new string('a', 201))));
Check("valid task accepted", () => Equal(true, TaskRules.IsValidTitle("Learn C#")));

string directory = Path.Combine(Path.GetTempPath(), "LearningPack-" + Guid.NewGuid().ToString("N"));
Directory.CreateDirectory(directory);
try {
  string path = Path.Combine(directory, "tasks.json");
  var repository = new TaskRepository(path);
  var created = repository.Add("Learn C#");
  Check("task starts incomplete", () => Equal(false, created.IsComplete));
  Check("completion persists", () => {
    repository.Complete(created.Id);
    var reloaded = new TaskRepository(path);
    Equal(true, reloaded.GetAll().Single().IsComplete);
  });
  Check("missing id returns null", () => Equal<StudyTask?>(null, repository.Complete(999)));
  Check("deletion persists", () => {
    Equal(true, repository.Delete(created.Id));
    Equal(0, new TaskRepository(path).GetAll().Count);
  });
  Check("IDs are never reused", () => Equal(2, repository.Add("Second task").Id));
  Check("corrupt storage fails visibly", () => {
    File.WriteAllText(path, "{ invalid json");
    Throws<System.Text.Json.JsonException>(() => { _ = new TaskRepository(path); });
  });
} finally {
  // This process created this unique directory and deletes only its own test data.
  Directory.Delete(directory, recursive: true);
}
Console.WriteLine($"Failures: {failures}");
return failures == 0 ? 0 : 1;

void Check(string name, Action action) {
  try {
    action();
    Console.WriteLine($"PASS: {name}");
  } catch (Exception error) {
    failures++;
    Console.Error.WriteLine($"FAIL: {name}: {error.Message}");
  }
}
static void Equal<T>(T expected, T actual) {
  if (!EqualityComparer<T>.Default.Equals(expected, actual)) {
    throw new InvalidOperationException($"Expected {expected}, got {actual}.");
  }
}
static void Throws<T>(Action action) where T : Exception {
  try {
    action();
  } catch (T) {
    return;
  }
  throw new InvalidOperationException($"Expected {typeof(T).Name}.");
}
