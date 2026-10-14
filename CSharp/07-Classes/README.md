# 07-Classes: Classes, records, and encapsulation

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn objects, constructors, properties, and records. Complete [06-Collections](../06-Collections/README.md) first.

## Understand the idea

A class defines a type; new creates an instance. A constructor initializes it and can enforce rules before the object exists. Properties expose data. A get-only property is initialized by the constructor. A private set lets the class change a property while preventing callers from setting it directly. Complete describes why the state changes. sealed prevents inheritance when it is unnecessary. A record is useful for data values and provides value-based equality. Class instances ordinarily compare by identity. Program.cs contains top-level statements; each core type lives in its own named file under the Google style convention.

## Step by step

1. Open Program.cs, StudySession.cs, and SessionSummary.cs. Read the comments before running them.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\07-Classes
```

## Expected result

```text
C#: 30 minutes; complete=True
Summary: C# / 30
```

## Exercise

Add a CompletedAt property and set it when Complete is called. Preserve the first completion time if Complete is called again.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use a nullable DateTimeOffset and ??=.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-07-completion-time.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-07-completion-time
# Implement the exercise, then verify:
dotnet run --project .\CSharp\07-Classes
git diff -- CSharp/07-Classes/Program.cs CSharp/07-Classes/StudySession.cs
git add -- CSharp/07-Classes/Program.cs CSharp/07-Classes/StudySession.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): record first completion time"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-07-completion-time`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
