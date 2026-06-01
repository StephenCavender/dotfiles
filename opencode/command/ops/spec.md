---
description: Write a spec before implementation. Produces spec.md with what, why, and acceptance criteria.
---

Before writing any code, produce a `spec.md` in the project root (or update the existing one).

## Required sections

1. **Goal** — One sentence: what does this change accomplish?
2. **Why** — What problem does this solve? Who benefits?
3. **Scope** — What's in, what's explicitly out.
4. **Acceptance Criteria** — Bullet list of concrete, testable conditions that mean "done."
5. **Non-goals** — Things that sound related but are not part of this work.

## Rules

- Keep it under 40 lines. If you need more, the scope is too big — split it.
- Acceptance criteria must be verifiable (a test could assert them).
- Don't write implementation details — that's the plan skill's job.
- If a spec.md already exists, update it rather than overwriting.
- Ask clarifying questions if the request is ambiguous before writing the spec.
