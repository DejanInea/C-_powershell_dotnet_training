var session = new StudySession("C#", 30);
session.Complete();
Console.WriteLine($"{session.Topic}: {session.Minutes} minutes; complete={session.IsComplete}");
var summary = new SessionSummary(session.Topic, session.Minutes);
Console.WriteLine($"Summary: {summary.Topic} / {summary.Minutes}");
