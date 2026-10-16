# 07-Data-Contracts exercise solution

The current JSON shape is an array of records containing Id, Title, and IsComplete. Domain reconstruction rechecks semantic rules, while JSON parsing checks the document's syntax and types.

Use a new test file to try invalid JSON; it should fail visibly. Do not overwrite learner data. A null document is invalid, not an empty store. Duplicate IDs make lookup ambiguous and are rejected.

A date-only optional due date could use a documented YYYY-MM-DD representation. Decide that missing dates mean "no deadline", then test old and new data. An instant would need time-zone/offset semantics instead. Adding a field is incomplete until compatibility is defined.

The sample rewrites the whole file directly. A crash can leave partial data, and concurrent writers can overwrite changes. A production design needs stronger persistence guarantees; an interface alone provides none.
