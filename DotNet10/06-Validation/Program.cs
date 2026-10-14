var builder = WebApplication.CreateBuilder(args);
// Keep local learning logs in the terminal rather than the Windows Event Log.
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
var app = builder.Build();
app.MapPost("/sessions", ValidateSession);
app.Run();

static IResult ValidateSession(CreateSession request) {
  if (string.IsNullOrWhiteSpace(request.Topic) || request.Topic.Length > 100) {
    return Results.ValidationProblem(new Dictionary<string, string[]> {
      ["topic"] = ["Use 1 to 100 nonblank characters."]
    });
  }

  if (request.Minutes is < 1 or > 180) {
    return Results.ValidationProblem(new Dictionary<string, string[]> {
      ["minutes"] = ["Use a value from 1 to 180."]
    });
  }

  return Results.Ok(new {
    Topic = request.Topic.Trim(),
    Minutes = request.Minutes
  });
}
