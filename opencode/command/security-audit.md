---
description: Audit changed code for security vulnerabilities
---

Audit the current diff (and the code paths it touches) for security issues.

Check, with `file:line` references:
- Untrusted input reaching queries, shell, filesystem, or eval (injection)
- Authn/authz gaps: missing checks, broken access control, privilege escalation
- Secrets or credentials committed or logged
- Unsafe deserialization, SSRF, path traversal in the changed paths
- Dependencies introduced with known vulnerabilities

Output:
- Findings by severity (Critical / High / Medium / Low), each with `file:line`, the attack scenario, and a concrete fix
- Remediation ordered by severity
