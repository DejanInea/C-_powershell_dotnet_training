# 02-Requirements suggested solution

"Save correctly": POST a valid title -> 201 with positive integer ID and isComplete=false; a new server instance using the same data path returns the task.

"Fast": choose a stated dataset, machine, load, percentile, and target with the team; do not invent an achieved number.

"Bad IDs": distinguish malformed noninteger routes from well-formed but absent integer IDs. The supplied routes yield 404 for both examples, for different reasons.

"Secure": identify deployment, users, sensitive data, and permitted actions first. The local teaching API has no authentication. It is not ready to infer public-service security guarantees.
