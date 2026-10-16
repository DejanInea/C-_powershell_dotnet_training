# 03-Risks suggested solution

A reasonable first hour checks valid persistence, invalid input leaving state unchanged, and visible handling of a controlled save failure. It also reviews the untested recovery limitation.

The course matrix uses likelihood x impact with impact 5 always escalated to High. This helps prevent a low likelihood estimate from hiding severe data-loss risk.

Do not confuse numeric ranking with certainty. Explain why you chose each estimate and what information could change it. "Needs requirement", "Known limitation", and "Not run" communicate different things.
