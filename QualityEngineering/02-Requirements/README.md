# 02-Requirements: Make correctness observable

Level: Beginner | Time: 45-60 minutes

## Learn the habit

Review a requirement before choosing test data. "Reject long titles" leaves open the length limit, measurement, whitespace handling, response, and whether anything was stored.

For the API, use the [contract](../Worked-Example/Contract.md). An expected result should name both response behavior and state. HTTP 400 alone does not demonstrate that invalid data was not saved.

## Example acceptance criterion

Given an empty isolated store, when POST /tasks receives a blank title, then the API returns 400 and a subsequent GET /tasks still returns an empty array.

Record the authority for that expectation. A requirement is stronger than "the current version did this once"; observed behavior may itself be defective.

## Exercise

Review these vague statements: "tasks save correctly", "the API is fast", "bad IDs are handled", "data is secure". Turn each into a question and one concrete acceptance criterion. Label assumptions that need a product decision.

Add one invalid-input case and one restart case to [Test-Case.md](../Templates/Test-Case.md).

## Done when

A teammate can judge pass or fail without guessing what "correctly" means. Requirements that are not yet agreed remain questions, not invented failures.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
