# 04-Test-Design suggested solution

Empty and blank titles fail; length 1 and 200 nonblank ASCII titles succeed; length 201 fails. Null/missing Title fail. A raw title with padding beyond 200 is rejected even if trimming would make it short, according to the current contract.

Repeated completion returns the same ID with isComplete=true and does not create a second task. Deleting then completing that ID returns 404.

Testing multiple ordinary 20-character titles adds little evidence about the 200/201 boundary. Unicode and whitespace deserve separate reasoning because normalization and representation can differ.
