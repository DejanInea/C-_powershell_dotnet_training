# 08-Testing: Executable checks and failure cases

Level: Advanced within this course | Suggested time: 60-90 minutes

## Goal

Learn assertions, boundaries, persistence checks, and test runners. Complete [07-HttpClient](../07-HttpClient/README.md) first.

## Understand the idea

A useful test exercises a contract rather than repeating its implementation. Equal compares actual and expected values. Throws verifies rejected inputs. Check catches failures to let the rest of the suite run, and the program returns a nonzero code when any check fails. Boundary cases include zero, negative values, limits, and overflow. Persistence checks construct a new repository after writing so an in-memory result cannot conceal a storage failure. The test uses a uniquely named temporary directory and cleans up only that directory. This is a package-free executable test harness, run with dotnet run rather than dotnet test. Professional teams often use xUnit, NUnit, or MSTest and add richer tooling.

## Step by step

1. Open Program.cs in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
dotnet run --project .\DotNet10\08-Testing
```

## Expected result

```text
Each contract prints PASS, followed by Failures: 0. A failing check prints FAIL and returns exit code 1.
```

## Exercise

Introduce a deliberate bug in StudyBudget, run the tests, confirm failure, then restore the correct rule.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Remove the negative-input guard temporarily and check which test catches it.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/dotnet10-08-boundary-cases.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/dotnet10-08-boundary-cases
# Implement the exercise, then verify:
dotnet run --project .\DotNet10\08-Testing
git diff -- DotNet10/08-Testing/README.md DotNet10/08-Testing/Program.cs
git add -- DotNet10/08-Testing/README.md DotNet10/08-Testing/Program.cs
git diff --cached
git diff --cached --check
git commit -m "test(dotnet10): check study budget boundaries"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Review the branch's history and include validation evidence in its pull request.

For GitHub practice, publish deliberately with `git push -u origin feat/dotnet10-08-boundary-cases`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
