# 10-Files: Files, JSON, and exceptions

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn serialization, paths, recoverable errors, and side effects. Complete [09-Linq](../09-Linq/README.md) first.

## Understand the idea

Serialization converts an object into a representation such as JSON. Deserialization reconstructs an object from that representation. System.Text.Json is included with .NET. Path.Combine builds platform-appropriate paths. Directory.CreateDirectory is safe when the directory already exists. Writing a file changes persistent state, so this example uses a dedicated output directory. A try block surrounds operations that can fail; catch handles specific exception types. Exceptions outside these types still surface. Do not silently ignore errors: the example writes an error and sets a nonzero exit code. Deserialized values still need validation before business use.

## Step by step

1. Open Program.cs and Session.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\10-Files
```

## Expected result

```text
Saved and loaded 2 sessions.
```

## Exercise

Read a separate missing file inside a try block and show a friendly message. Do not delete the sample file.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

FileNotFoundException is a more specific IOException.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-10-missing-file.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-10-missing-file
# Implement the exercise, then verify:
dotnet run --project .\CSharp\10-Files
git diff -- CSharp/10-Files/Program.cs
git add -- CSharp/10-Files/Program.cs
git diff --cached
git diff --cached --check
git commit -m "fix(csharp): handle missing study files"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-10-missing-file`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
