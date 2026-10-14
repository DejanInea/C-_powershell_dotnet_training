using System.Net.Http.Json;
using System.Text.Json;

string baseUrl = args.Length > 0 ? args[0] : "http://127.0.0.1:5081";
using var http = new HttpClient {
  BaseAddress = new Uri(baseUrl),
  Timeout = TimeSpan.FromSeconds(5)
};
using var cancellation = new CancellationTokenSource(TimeSpan.FromSeconds(5));
try {
  var response = await http.GetFromJsonAsync<HealthResponse>("/health", cancellation.Token)
      ?? throw new InvalidDataException("The server returned null.");
  Console.WriteLine($"Server status: {response.Status}");
} catch (Exception error) when (
    error is HttpRequestException or OperationCanceledException or JsonException
        or InvalidDataException) {
  Console.Error.WriteLine($"Request failed: {error.Message}");
  Environment.ExitCode = 1;
}
