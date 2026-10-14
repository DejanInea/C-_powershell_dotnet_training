public sealed class ConsoleNotifier : INotifier {
  public void Send(string message) {
    Console.WriteLine(message);
  }
}
