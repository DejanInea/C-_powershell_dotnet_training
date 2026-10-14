# 10-Capstone: Control the .NET task API

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn http requests, json payloads, api contracts, and automation. Complete [09-Modules](../09-Modules/README.md) first.

## Understand the idea

Invoke-RestMethod sends HTTP requests and deserializes JSON responses. GET reads; POST creates; PUT updates; DELETE removes in this teaching API. Content-Type tells the server how to interpret the request body. Explicit UTF8 bytes preserve non-ASCII titles across PowerShell versions. The API defines paths and status codes; a failing HTTP status raises an error in this script. ShouldProcess protects mutations and supports WhatIf. Keep formatting at the presentation boundary so returned tasks remain objects. The API must be running before List or a mutation. BaseUri allows a different loopback port. This client and the server are local learning tools without authentication.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. If the example is a server, leave it running and use a second terminal for requests; stop it with Ctrl+C afterward.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\10-Capstone\Demo.ps1
# After starting the server in a second terminal:
.\PowerShell\10-Capstone\Demo.ps1 -Action Add -Title 'Learn PowerShell'
.\PowerShell\10-Capstone\Demo.ps1 -Action List
```

## Expected result

```text
Default run prints help. With the server running, Add returns an object containing id, title, and isComplete; List returns saved tasks.
```

## Exercise

Preview completion with WhatIf, then complete a real task and verify IsComplete. Use the ID returned by Add.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Capture Add's result in a variable instead of assuming the ID is 1.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-10-task-client.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-10-task-client
# Implement the exercise, then verify:
.\PowerShell\10-Capstone\Demo.ps1 -Action List
git diff -- PowerShell/10-Capstone/Demo.ps1
git add -- PowerShell/10-Capstone/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "test(powershell): verify task client completion"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-10-task-client`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
