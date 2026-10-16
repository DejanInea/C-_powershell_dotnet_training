using System.Text.Json;
using StudyTasks.Application;
using StudyTasks.Checks;
using StudyTasks.Domain;
using StudyTasks.Infrastructure;

int failures = 0;
string directory = Path.Combine(Directory.GetCurrentDirectory(), ".artifacts",
    "architecture-checks-" + Guid.NewGuid().ToString("N"));
Directory.CreateDirectory(directory);

Check("valid title is trimmed and starts incomplete", () => {
  var task = StudyTask.Create("  Read C#  ");
  Equal("Read C#", task.Title);
  Equal(false, task.IsComplete);
  Equal(false, task.Id == Guid.Empty);
});
Check("80 code units accepted", () =>
    Equal(80, StudyTask.Create(new string('a', 80)).Title.Length));
Check("81 code units rejected", () =>
    Throws<ArgumentException>(() => StudyTask.Create(new string('a', 81))));
Check("empty ID rejected", () =>
    Throws<ArgumentException>(() => new StudyTask(Guid.Empty, "Read")));
Check("invalid title never loads or saves", () => {
  var store = new RecordingTaskStore();
  var service = new TaskService(store);
  Throws<ArgumentException>(() => service.Add("   "));
  Equal(0, store.LoadCalls);
  Equal(0, store.SaveCalls);
});
Check("missing ID never saves", () => {
  var store = new RecordingTaskStore();
  var service = new TaskService(store);
  Throws<KeyNotFoundException>(() => service.Complete(Guid.NewGuid()));
  Equal(0, store.SaveCalls);
});
Check("completion preserves identity and is repeatable", () => {
  var service = new TaskService(new InMemoryTaskStore());
  var added = service.Add("Read architecture");
  var completed = service.Complete(added.Id);
  var repeated = service.Complete(added.Id);
  Equal(added.Id, completed.Id);
  Equal(added.Title, completed.Title);
  Equal(false, added.IsComplete);
  Equal(true, completed.IsComplete);
  Equal(completed, repeated);
  Equal(1, service.List().Count);
});
Check("save failure is propagated", () => {
  var store = new RecordingTaskStore { FailOnSave = true };
  var service = new TaskService(store);
  Throws<IOException>(() => service.Add("Read"));
});
Check("memory store returns independent collection snapshots", () => {
  var store = new InMemoryTaskStore();
  var input = new[] { StudyTask.Create("Original") };
  store.Save(input);
  input[0] = StudyTask.Create("Changed");
  Equal("Original", store.Load()[0].Title);
  var output = (StudyTask[])store.Load();
  output[0] = StudyTask.Create("Changed again");
  Equal("Original", store.Load()[0].Title);
});
Check("missing file means empty store", () =>
    Equal(0, new JsonTaskStore(Path.Combine(directory, "missing.json")).Load().Count));
Check("JSON survives new instances and completion", () => {
  string path = Path.Combine(directory, "roundtrip.json");
  var original = new TaskService(new JsonTaskStore(path));
  var added = original.Add("Read \"interfaces\" & arrows");
  var restarted = new TaskService(new JsonTaskStore(path));
  Equal(added, restarted.List().Single());
  restarted.Complete(added.Id);
  Equal(true, new JsonTaskStore(path).Load().Single().IsComplete);
});
Check("malformed JSON is not silently erased", () => {
  string path = Path.Combine(directory, "corrupt.json");
  File.WriteAllText(path, "{ broken");
  Throws<JsonException>(() => new JsonTaskStore(path).Load());
  Equal("{ broken", File.ReadAllText(path));
});
Check("null JSON document rejected", () => {
  string path = Path.Combine(directory, "null.json");
  File.WriteAllText(path, "null");
  Throws<InvalidDataException>(() => new JsonTaskStore(path).Load());
});
Check("duplicate IDs rejected", () => {
  string path = Path.Combine(directory, "duplicate.json");
  Guid id = Guid.NewGuid();
  var rows = new[] { new StoredTask(id, "First", false), new StoredTask(id, "Second", false) };
  File.WriteAllText(path, JsonSerializer.Serialize(rows));
  Throws<InvalidDataException>(() => new JsonTaskStore(path).Load());
});
Check("stored invalid title is a data failure", () => {
  string path = Path.Combine(directory, "invalid-title.json");
  var rows = new[] { new StoredTask(Guid.NewGuid(), "   ", false) };
  File.WriteAllText(path, JsonSerializer.Serialize(rows));
  Throws<InvalidDataException>(() => new JsonTaskStore(path).Load());
});
Check("filesystem write failure is visible", () => {
  string blocked = Path.Combine(directory, "directory-not-file");
  Directory.CreateDirectory(blocked);
  Throws<UnauthorizedAccessException>(() =>
      new JsonTaskStore(blocked).Save([StudyTask.Create("Cannot write")]));
});

Console.WriteLine($"Failures: {failures}");
Console.WriteLine($"Isolated test data retained at: {directory}");
return failures == 0 ? 0 : 1;

void Check(string label, Action action) {
  try {
    action();
    Console.WriteLine($"PASS: {label}");
  } catch (Exception error) {
    failures++;
    Console.Error.WriteLine($"FAIL: {label}: {error.Message}");
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
