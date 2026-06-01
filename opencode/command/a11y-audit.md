---
description: Audit changed UI for accessibility issues
---

Audit the UI in the current diff for accessibility, targeting WCAG 2.1 AA.

Check, with `file:line` references:
- Interactive elements reachable and operable by keyboard (focus order, visible focus, no traps)
- Semantic HTML before ARIA; ARIA only where native semantics fall short
- Text alternatives for non-text content; labels tied to form controls
- Color contrast meets AA; meaning never conveyed by color alone

Output:
- Status: Pass / Fail / Partial
- Findings by severity (Critical / Serious / Moderate / Minor), each with `file:line`, the failing WCAG criterion, and a before/after fix
