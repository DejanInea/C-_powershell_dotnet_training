# 05-MinimalApi: Your first HTTP API

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn http routes, responses, json, and a server process. Complete [04-DependencyInjection](../04-DependencyInjection/README.md) first.

## Understand the idea

An API lets another program request behavior through a contract. ASP.NET Core hosts the HTTP server. A route matches a path and HTTP method. MapGet registers a handler for GET. A path parameter such as {name} is bound to a handler parameter. Results.Ok returns status 200 and serializes an object as JSON. The server keeps running until you press Ctrl+C. Start it in one terminal and send requests from another. The run command binds only to the local machine using a loopback address. A port can be used by only one listening process; choose a different port if it is already occupied.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. If the example is a server, leave it running and use a second terminal for requests; stop it with Ctrl+C afterward.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\05-MinimalApi -- --urls http://127.0.0.1:5081
# In a second terminal:
Invoke-RestMethod http://127.0.0.1:5081/health
Invoke-RestMethod http://127.0.0.1:5081/hello/Dejan
```

## Expected result

```text
Health returns status=ok. Hello returns message=Hello, Dejan! The server prints startup logs.
```

## Exercise

Add GET /minutes/{count:int} returning hours. Return 400 for a negative count.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. Restart the server after editing its code.

## Hint

An int route constraint limits which paths match; a value rule still needs validation.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-05-minutes-route.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-05-minutes-route
# Implement the exercise, then verify:
# Run this lesson's README server/client checks in the required terminals.
git diff -- DotNet10/05-MinimalApi/README.md DotNet10/05-MinimalApi/Program.cs
git add -- DotNet10/05-MinimalApi/README.md DotNet10/05-MinimalApi/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(dotnet10): add a minutes conversion endpoint"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-05-minutes-route`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
