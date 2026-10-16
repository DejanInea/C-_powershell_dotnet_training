# Practice target contract

Target: DotNet10/10-Capstone, a local ASP.NET Core API with JSON file persistence.

| ID | Contract / scope |
| --- | --- |
| R-00 | GET /health returns 200 with status=ok while the server is ready |
| R-01 | POST /tasks with a valid title returns 201, positive integer ID, trimmed title, isComplete=false |
| R-02 | GET /tasks returns an array; GET /tasks/{integer-id} returns that task or 404 |
| R-03 | Title must be nonblank; raw title.Length <=200 UTF-16 code units before trimming; invalid input returns 400 with no added task |
| R-04 | PUT /tasks/{id}/complete preserves identity/title and returns isComplete=true; absent ID returns 404; repeating completion does not create a task |
| R-05 | DELETE /tasks/{id} returns 204 when present; subsequent read/delete returns 404 |
| R-06 | A restarted server using the same valid data file preserves saved identity and state |
| R-07 | A save failure must not be reported as successful; exact recovery/durability goals need explicit requirements and tests |
| R-08 | Deployment is local learning, one server process per data file; no shared-user identity or browser UI is supplied |

The test basis is the target's Program.cs, TaskRules.cs, TaskRepository.cs, and course behavior. Read the code to review the contract; raise ambiguities rather than relying on a worksheet alone.

Duplicate titles are currently allowed. A timeout and retry are not automatically one logical request without an agreed idempotency contract.

The server's in-process lock serializes repository changes inside that process. It does not coordinate independent processes using the same file. Temp-file replacement improves the write path but does not by itself establish power-loss durability.

Unicode visible-character counts may differ from string.Length. The 200-unit rule is specific to this API; the Architecture example uses a different 80-unit rule and GUID identifiers.
