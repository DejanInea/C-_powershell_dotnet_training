public sealed class StudyTracker(INotifier notifier) {
  public void Finish(string topic) {
    notifier.Send($"Completed: {topic}");
  }
}
