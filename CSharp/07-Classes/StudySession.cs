public sealed class StudySession {
  public string Topic {
    get;
  }
  public int Minutes {
    get;
  }
  public bool IsComplete {
    get; private set;
  }

  public StudySession(string topic, int minutes) {
    if (string.IsNullOrWhiteSpace(topic)) {
      throw new ArgumentException("Topic is required.", nameof(topic));
    }

    if (minutes <= 0) {
      throw new ArgumentOutOfRangeException(nameof(minutes));
    }

    Topic = topic;
    Minutes = minutes;
  }

  public void Complete() {
    IsComplete = true;
  }
}
