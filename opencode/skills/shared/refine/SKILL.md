---
name: refine
description: Reflect on the current session — capture mistakes, patterns, and decisions into docs/ for future sessions. Run at the end of a work block.
---

# Refine

After completing a task or series of changes, reflect on what happened and improve the project's documentation for future agent sessions.

## Steps

1. Think about what happened during this session:
   - What errors occurred and how were they fixed?
   - What patterns or conventions did you discover?
   - What decisions were made that aren't obvious from code alone?

2. Check if `docs/` exists. If not, create it.

3. Find the right place for new knowledge:
   - Existing doc that should be updated? Update it.
   - New concept that deserves its own doc? Create one.
   - Small enough to be a note? Append to `docs/decisions.md`.

4. Write concisely. Future agents need to know _what_ and _why_, not a narrative of the session.

5. Do NOT update AGENTS.md unless the change is a fundamental project rule.
