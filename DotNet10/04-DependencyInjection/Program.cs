using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

var services = new ServiceCollection();
services.AddLogging(builder => builder.AddSimpleConsole(options => options.SingleLine = true));
services.AddSingleton<IGoalService, GoalService>();
using ServiceProvider provider = services.BuildServiceProvider();
var goal = provider.GetRequiredService<IGoalService>();
Console.WriteLine($"Remaining: {goal.Remaining(20, 60)} minutes");
