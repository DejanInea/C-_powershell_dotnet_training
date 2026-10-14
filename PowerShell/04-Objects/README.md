# 04-Objects: Objects and properties

Level: Intermediate | Suggested time: 45-60 minutes

## Goal

Learn structured output and object inspection. Complete [03-ControlFlow](../03-ControlFlow/README.md) first.

## Understand the idea

PowerShell usually passes objects through its pipeline. An object has properties containing data and methods providing operations. PSCustomObject creates an object with named fields from a hashtable. Get-Member reveals the object's type, properties, and methods. Selecting a property is different from converting an object to text. Select-Object chooses fields while preserving objects. Format-Table and Format-List create display instructions and should appear only at the end of a display pipeline. Keep data structured until the final presentation, export, or serialization step. This is why PowerShell can sort by Minutes without parsing printed columns.

## Step by step

1. Open Demo.ps1 in this lesson. Read the comments before running it.
2. Predict the main output on paper. Identify the inputs, the operation, and the result.
3. Run the commands below from the repository root. A comment beginning with # tells you which terminal to use.
4. Compare the output with the expected result. Explain any difference before changing the code.
5. Change one value and run again. Explain which lines caused the output to change.
6. Attempt the exercise before opening SOLUTION.md. Keep your first attempt so you can compare it.

## Run

```powershell
.\PowerShell\04-Objects\Demo.ps1
```

## Expected result

```text
An object with Topic=PowerShell, Minutes=30, Complete=True; member information; Topic property: PowerShell. Table spacing varies.
```

## Exercise

Create a second object and export both to JSON in the console. Confirm it contains property names.

Work in this lesson's source file. For multiple experiments, copy the example into this lesson's output directory rather than changing later lessons. Rebuild after C# edits. 

## Hint

Use an array of objects and ConvertTo-Json.

## Git checkpoint

Read [the shared Git workflow](../../Git-Workflow.md) first. Save the supplied baseline and finish the previous branch before starting. Use this branch for the exercise: feat/powershell-04-json-output.

```powershell
git switch main
git status --short
# If using GitHub: git fetch origin; git pull --ff-only origin main
git switch -c feat/powershell-04-json-output
# Implement the exercise, then verify:
.\PowerShell\04-Objects\Demo.ps1
git diff -- PowerShell/04-Objects/Demo.ps1
git add -- PowerShell/04-Objects/Demo.ps1
git diff --cached
git diff --cached --check
git commit -m "feat(powershell): serialize study objects"
```

Stage only files you actually changed, and adapt the message to the change you made. If the exercise is just an experiment, record its result in a short lesson note and commit that note with a docs or test message instead. Keep this commit limited to one exercise; explain the rule and the verification in its message body.

For GitHub practice, publish deliberately with `git push -u origin feat/powershell-04-json-output`, then open and review a PR to main. For local practice, switch to main and merge this branch using the shared guide. Choose one completion path. Record the resulting commit ID in Progress.md.

## Explain it yourself

- What data enters this example, and what data leaves it?
- Which line implements the main rule?
- What would happen if a value were missing or invalid?
- Where would you place the rule if another caller needed it?

See [SOLUTION.md](SOLUTION.md) after your attempt. The solution is a suggested modification to the working example, not a separate runnable project.
