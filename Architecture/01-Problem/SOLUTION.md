# 01-Problem exercise solution

A useful brief says: one local learner creates and completes study tasks offline. Completion preserves ID and title, changes IsComplete, and survives a new process. Listing an empty store returns an empty list.

Blank or overlong titles are rejected without writing storage. Completing an unknown ID reports not found without saving. A storage write error produces failure, not a success message. A missing file means an empty store; malformed existing data is an error.

One possible target: with 1,000 tasks on the learner's Windows machine, list completes within one second after process startup, measured across five warm runs. Treat this as a target to measure, not a claim about the sample.

Defer authentication, notifications, and multiuser sharing. Those change scope and failure modes. New shared access would invalidate the single-writer file assumption.

Your wording may differ. Check that every requirement has observable evidence.
