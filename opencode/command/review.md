---
description: Review the current diff for quality, correctness, and maintainability
---

Review the diff against the base branch (`git diff main...HEAD` or the PR base).

Flag, with `file:line` references:
- Bugs, unhandled edge cases, and error paths that swallow failures
- Duplicated logic that should be extracted (DRY)
- Names that obscure intent at the call site
- Missing or weak test coverage for changed behavior
- Security-sensitive changes (auth, input handling, secrets)

Output:
- Verdict: Approved / Changes Requested / Blocked
- Findings grouped by severity (Critical / Important / Minor), each with `file:line` and a concrete fix
- Skip praise and summaries — report only what needs action
