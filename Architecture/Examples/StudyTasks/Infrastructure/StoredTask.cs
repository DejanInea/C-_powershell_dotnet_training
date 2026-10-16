namespace StudyTasks.Infrastructure;

// A storage representation, kept outside Domain.
public sealed record StoredTask(Guid Id, string? Title, bool IsComplete);
