namespace LearningTasks;

public static class TaskRules {
  private const int _maxTitleLength = 200;

  public static bool IsValidTitle(string? title) {
    return !string.IsNullOrWhiteSpace(title) && title.Length <= _maxTitleLength;
  }
}
