# 06-Validation: Validate request bodies and status codes

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn body binding, validation responses, and api design. Complete [05-MinimalApi](../05-MinimalApi/README.md) first.

## Understand the idea

ASP.NET Core binds a complex request parameter from a JSON body. A nullable property honestly models missing or null input. Binding checks representation, such as whether a number is valid JSON, while domain validation checks meaning. This example explicitly validates fields inside the handler rather than depending on implicit validation conventions. ValidationProblem returns a structured 400 response. The valid request returns 200 because this endpoint only validates and echoes data; it does not persist a resource. The capstone uses 201 for a created task and 404 for a missing ID. Clients should inspect status codes and handle failures.

## Step by step

1. Open Program.cs and CreateSession.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. If the example is a server, leave it running and use a second terminal for requests; stop it with Ctrl+C afterward.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\06-Validation -- --urls http://127.0.0.1:5082
# Second terminal:
$body = @{
  topic = 'CSharp'
  minutes = 30
} | ConvertTo-Json
Invoke-RestMethod http://127.0.0.1:5082/sessions -Method Post -ContentType application/json -Body $body
```

## Expected result

```text
A valid request returns topic=CSharp and minutes=30. Blank topics or minutes=0 return HTTP 400.
```

## Exercise

Make two requests: one valid and one with minutes=0. Catch the expected client exception for the invalid request.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. Restart the server after editing its code.

## Hint

Invoke-RestMethod throws for a failing HTTP status.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-06-invalid-input.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-06-invalid-input
# Implement the exercise, then verify:
# Run this lesson's README server/client checks in the required terminals.
git diff -- DotNet10/06-Validation/README.md DotNet10/06-Validation/Program.cs
git add -- DotNet10/06-Validation/README.md DotNet10/06-Validation/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(dotnet10): verify invalid session requests"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-06-invalid-input`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
