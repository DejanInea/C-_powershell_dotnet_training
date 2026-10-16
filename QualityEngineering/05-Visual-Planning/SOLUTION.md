# 05-Visual-Planning suggested solution

R-01 title validation maps to valid creation and blank/200/201/null/type cases. R-02 completion maps to existing, repeated, and absent IDs. R-03 persistence maps to a restart check and a planned controlled failure/recovery investigation.

The supplied API runner covers a small repeatable subset. It does not prove crash durability, performance under load, shared-user access control, or browser accessibility.

A case can be Done as work while its result is Failed. A planned case with no evidence remains Not run even if its requirement is marked implemented.
