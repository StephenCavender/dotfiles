---
description: Audit changed code for security vulnerabilities
---

Audit the current diff (and the code paths it touches) for security issues.

**Intensity** (pass as argument, default: normal):
- `quick` — Changed lines only. Flag injection, hardcoded secrets, and missing auth checks. Skip threat modeling.
- `normal` — Changed lines + touched code paths. Full checklist below.
- `paranoid` — Full threat model: enumerate trust boundaries crossed by the change, map data flows from untrusted sources to sinks, assess supply-chain risk of new dependencies.

Check, with `file:line` references:
- Untrusted input reaching queries, shell, filesystem, or eval (injection)
- Authn/authz gaps: missing checks, broken access control, privilege escalation
- Secrets or credentials committed or logged
- Unsafe deserialization, SSRF, path traversal in the changed paths
- Dependencies introduced with known vulnerabilities

Output:
- Findings by severity (Critical / High / Medium / Low), each with `file:line`, the attack scenario, and a concrete fix
- Remediation ordered by severity
