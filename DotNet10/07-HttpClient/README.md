# 07-HttpClient: Call an API from C#

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn http clients, timeouts, deserialization, and failure handling. Complete [06-Validation](../06-Validation/README.md) first.

## Understand the idea

HttpClient sends requests. GetFromJsonAsync combines a GET request, successful-status checking, and JSON deserialization. A BaseAddress provides the server origin; the relative path selects an endpoint. A timeout limits how long a request can wait, and a cancellation token lets a caller stop it. The response type describes the JSON fields you expect. A successful HTTP response can still contain null or incompatible data, so consider both transport and content errors. This short console application owns one HttpClient for its lifetime. Long-running services should reuse clients or use IHttpClientFactory rather than construct and dispose one per request.

## Step by step

1. Open Program.cs and HealthResponse.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. If the example is a server, leave it running and use a second terminal for requests; stop it with Ctrl+C afterward.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
# Start lesson 05 in a separate terminal first.
dotnet run --project .\DotNet10\07-HttpClient -- http://127.0.0.1:5081
```

## Expected result

```text
Server status: ok. If the server is stopped, the client reports an error and exits with code 1.
```

## Exercise

Stop the server, run the client, and inspect LASTEXITCODE. Restart the server and verify success.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Check the process exit code immediately after dotnet.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-07-connection-failure.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-07-connection-failure
# Implement the exercise, then verify:
# Run this lesson's README server/client checks in the required terminals.
git diff -- DotNet10/07-HttpClient/README.md DotNet10/07-HttpClient/Program.cs
git add -- DotNet10/07-HttpClient/README.md DotNet10/07-HttpClient/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(dotnet10): document client failure behavior"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-07-connection-failure`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
