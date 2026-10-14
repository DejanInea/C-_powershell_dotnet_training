public sealed class StudyEntry {
  // C# 14: field refers to the compiler-created backing field.
  public string Topic {
    get;
    init => field = string.IsNullOrWhiteSpace(value)
        ? throw new ArgumentException("Topic is required.")
        : value.Trim();
  }
  public int Minutes {
    get; init;
  }

  [System.Text.Json.Serialization.JsonConstructor]
  public StudyEntry(string topic, int minutes) {
    if (minutes is < 1 or > 180) {
      throw new ArgumentOutOfRangeException(nameof(minutes));
    }

    Topic = topic;
    Minutes = minutes;
  }
}
