namespace StudyMath;

public static class StudyBudget {
  public static int TotalMinutes(int sessions, int minutesPerSession) {
    if (sessions < 0) {
      throw new ArgumentOutOfRangeException(nameof(sessions));
    }

    if (minutesPerSession < 0) {
      throw new ArgumentOutOfRangeException(nameof(minutesPerSession));
    }

    return checked(sessions * minutesPerSession);
  }
  public static bool HasReachedGoal(int completed, int target) {
    if (completed < 0) {
      throw new ArgumentOutOfRangeException(nameof(completed));
    }

    if (target < 0) {
      throw new ArgumentOutOfRangeException(nameof(target));
    }

    return completed >= target;
  }
}
