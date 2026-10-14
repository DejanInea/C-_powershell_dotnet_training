using Microsoft.Extensions.Logging;

public sealed class GoalService : IGoalService {
  private readonly ILogger<GoalService> _logger;

  public GoalService(ILogger<GoalService> logger) {
    _logger = logger;
  }

  public int Remaining(int completed, int target) {
    if (completed < 0 || target < 0) {
      throw new ArgumentOutOfRangeException(nameof(completed));
    }
    _logger.LogInformation("Calculating remaining minutes for target {Target}", target);
    return Math.Max(0, target - completed);
  }
}
