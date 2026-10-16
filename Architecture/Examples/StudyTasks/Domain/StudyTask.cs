namespace StudyTasks.Domain;

public sealed record StudyTask {
  public const int MaxTitleLength = 80;

  public Guid Id {
    get;
  }
  public string Title {
    get;
  }
  public bool IsComplete {
    get;
  }

  public StudyTask(Guid id, string title, bool isComplete = false) {
    if (id == Guid.Empty) {
      throw new ArgumentException("A task needs a nonempty ID.", nameof(id));
    }
    ArgumentException.ThrowIfNullOrWhiteSpace(title);
    string normalized = title.Trim();
    if (normalized.Length > MaxTitleLength) {
      throw new ArgumentException("Use 1-80 nonblank title characters.", nameof(title));
    }

    Id = id;
    Title = normalized;
    IsComplete = isComplete;
  }

  public static StudyTask Create(string title) {
    return new StudyTask(Guid.NewGuid(), title);
  }

  public StudyTask Complete() {
    return new StudyTask(Id, Title, isComplete: true);
  }
}
