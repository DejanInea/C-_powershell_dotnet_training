# 04-Loops: Loops and arrays

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn repeated work and zero-based indexing. Complete [03-Decisions](../03-Decisions/README.md) first.

## Understand the idea

An array groups values of one type. The square-bracket collection expression creates the array. A for loop has initialization, a condition, and an update. index starts at zero; index < Length keeps access inside the array. index++ increases the counter by one. total += value is shorthand for adding a value and assigning the result. A while loop tests its condition before each iteration. Its body must eventually change the condition, or it can run forever. A foreach loop is useful when you need each value but not its index. Reading beyond the array's last index throws an exception.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\CSharp\04-Loops
```

## Expected result

```text
Session 1: 15 minutes
Session 2: 20 minutes
Session 3: 25 minutes
Total: 60 minutes
Practice rounds left: 2
Practice rounds left: 1
```

## Exercise

Print the average session length and count sessions of at least 20 minutes using foreach.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use a separate counter and convert the total to double before division.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/csharp-04-session-statistics.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/csharp-04-session-statistics
# Implement the exercise, then verify:
dotnet run --project .\CSharp\04-Loops
git diff -- CSharp/04-Loops/Program.cs
git add -- CSharp/04-Loops/Program.cs
git diff --cached
git diff --cached --check
git commit -m "feat(csharp): count longer study sessions"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/csharp-04-session-statistics`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
