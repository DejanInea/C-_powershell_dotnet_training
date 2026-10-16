# 08-Solutions suggested solution

If evidence supports a lost-response/retry scenario and an agreed deduplication requirement, a server-side submission key is one option. Test same key/same payload, same key/different payload, two simultaneous requests, expiry, and response loss after commit.

A click-disable change alone cannot prove correct retry behavior across refreshes or clients. A full redesign without a confirmed requirement may be unnecessary.

For a local title-validation defect, the smaller solution might be a corrected boundary rule plus 199/200/201 and state-unchanged checks. Choose the solution that addresses the established cause and scope.
