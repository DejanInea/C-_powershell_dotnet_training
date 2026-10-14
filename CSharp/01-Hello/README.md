# 01-Hello: Your first program

Level: Beginner | Suggested time: 30-45 minutes

## Goal

Learn output and command-line arguments. Complete the setup in the track README.

## Understand the idea

Console.WriteLine writes one line to the terminal. A string is text inside double quotes. A semicolon ends a statement. Top-level statements let the compiler create the entry point for you. args is an array of text arguments; Length tells you how many items it contains. Arrays count from zero, so args[0] is the first argument. The conditional expression condition ? yes : no chooses one value. A dollar sign before a string enables interpolation: the value inside braces is inserted into the text.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\01-Hello -- Dejan
```

## Expected result

```text
Hello, C#!
Welcome, Dejan!
```

## Exercise

Add a second argument for your city. If it is missing, use Ljubljana. Print a third line: City: Ljubljana.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Check args.Length > 1 before reading args[1].

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-01-city.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-01-city
# Implement the exercise, then verify:
dotnet run --project .\CSharp\01-Hello -- Dejan Ljubljana
git diff -- CSharp/01-Hello/Program.cs
git add -- CSharp/01-Hello/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): accept an optional city argument"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Explain the difference between working edits and the staged snapshot.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-01-city`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
