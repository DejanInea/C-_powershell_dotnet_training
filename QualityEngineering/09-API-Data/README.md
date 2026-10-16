# 09-API-Data: Inspect responses and side effects

Level: Intermediate | Time: 60-90 minutes | Prerequisite: basic PowerShell and HTTP

## Learn the habit

For each API action inspect request, response status, response body, resulting state, and important later behavior. HTTP 200 alone is a weak oracle.

Read [Labs/README.md](../Labs/README.md), then run the automated local lab. Open its generated HTML report and find the corresponding CSV row. Compare the case ID with the workbook.

The lab uses unique data and its own server process. You do not need Postman, but an importable collection is provided if you prefer its visual request/response interface.

## Exercise

1. Explain why valid creation should produce 201 and an incomplete task.
2. Check blank and 201-unit titles, then inspect the list to verify no task was inserted.
3. Complete a task twice and compare identity/state.
4. Restart the server using the same data path and read the task again.
5. Delete it and request it again.
6. Pick a passing check and name a realistic bug it would miss.

The runner includes malformed and wrong-type JSON inputs. Treat exact error-body wording as implementation detail unless your contract promises it.

## Done when

You can distinguish transport/binding failures, business validation, missing resources, and persistence problems. You can name what's outside this lab's evidence.

Read [SOLUTION.md](SOLUTION.md) after your attempt.
