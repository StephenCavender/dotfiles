---
description: Review the current diff for quality, correctness, and maintainability
---

Review the diff against the base branch (`git diff main...HEAD` or the PR base).

**Intensity** (pass as argument, default: normal):
- `quick` — Changed lines only. Flag obvious bugs and missing error handling. Skip style, naming, and test coverage.
- `normal` — Changed lines + immediate context. Full checklist below.
- `thorough` — Follow changed code into callers/callees (2 hops). Assess cross-module impact, concurrency, and data-flow invariants.

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
