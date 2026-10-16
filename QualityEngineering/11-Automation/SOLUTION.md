# 11-Automation suggested solution

Boundary validation is a strong early candidate: stable inputs, clear expected results, and fast execution. The restart check costs more setup but covers a distinct persistence risk.

A browser test is premature for an API-only target. When a UI exists, choose a small important journey, robust user-facing selectors, explicit assertions, and trace evidence.

The supplied runner records results even on failures, stops only its own server, and returns a failing exit status. A future CI job can run it and retain reports. A retry that later passes still deserves investigation if the earlier failure is unexplained.
