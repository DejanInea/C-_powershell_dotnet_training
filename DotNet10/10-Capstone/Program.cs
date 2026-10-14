using LearningTasks;

var builder = WebApplication.CreateBuilder(args);
// Keep local learning logs in the terminal rather than the Windows Event Log.
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
string dataPath = builder.Configuration["TrainingDataPath"]
    ?? Path.Combine(AppContext.BaseDirectory, "output", "tasks.json");
builder.Services.AddSingleton(new TaskRepository(dataPath));
var app = builder.Build();

app.MapGet("/health", () => Results.Ok(new { Status = "ok" }));
app.MapGet("/tasks", (TaskRepository repository) => Results.Ok(repository.GetAll()));
app.MapGet("/tasks/{id:int}", (int id, TaskRepository repository) =>
    repository.GetAll().FirstOrDefault(task => task.Id == id) is { } task
        ? Results.Ok(task) : Results.NotFound());
app.MapPost("/tasks", CreateStudyTask);
app.MapPut("/tasks/{id:int}/complete", (int id, TaskRepository repository) =>
    repository.Complete(id) is { } task ? Results.Ok(task) : Results.NotFound());
app.MapDelete("/tasks/{id:int}", (int id, TaskRepository repository) =>
    repository.Delete(id) ? Results.NoContent() : Results.NotFound());
app.Run();

static IResult CreateStudyTask(CreateTask request, TaskRepository repository) {
  if (!TaskRules.IsValidTitle(request.Title)) {
    return Results.ValidationProblem(new Dictionary<string, string[]> {
      ["title"] = ["Use 1 to 200 nonblank characters."]
    });
  }

  var task = repository.Add(request.Title!);
  return Results.Created($"/tasks/{task.Id}", task);
}
