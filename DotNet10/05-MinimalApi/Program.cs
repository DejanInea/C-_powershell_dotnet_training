var builder = WebApplication.CreateBuilder(args);
// Keep local learning logs in the terminal rather than the Windows Event Log.
builder.Logging.ClearProviders();
builder.Logging.AddConsole();
var app = builder.Build();
app.MapGet("/health", () => Results.Ok(new { Status = "ok" }));
app.MapGet("/hello/{name}", (string name) => Results.Ok(new { Message = $"Hello, {name}!" }));
app.Run();
