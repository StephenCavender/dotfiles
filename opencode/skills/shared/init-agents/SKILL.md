---
name: init-agents
description: Generate an AGENTS.md for a new project. Reads the template from ~/.dotfiles/AGENTS.template.md, explores the current codebase, and produces a tailored file.
---

# Init AGENTS.md

Write an AGENTS.md for this project based on the template at `~/.dotfiles/AGENTS.template.md`.

## Steps

1. Read the template.
2. Explore this project's codebase to understand:
   - What framework/stack is actually in use (check package.json, tsconfig, etc.)
   - What patterns exist in the code already
   - What commands are available (dev, build, test, lint)

3. Produce an AGENTS.md that:
   - Keeps the Philosophy section verbatim from the template
   - Keeps the Rules section verbatim
   - Rewrites the Stack section to match THIS project's actual stack
   - Rewrites the Commands section to match THIS project's actual scripts
   - Updates the "When stuck" section only if the project has a docs/ folder or unusual structure

## Constraints

- **Target: 30 lines. Hard cap: 50 lines.** If you're over, you haven't cut enough.
- A flat list of rules > nested headers with sparse content
- No "where to look" tables — you can explore the codebase yourself
- No linting/formatting rules — those belong in eslint/prettier configs
- No role definitions — don't tell yourself what you are
- Don't document things inferable from reading package.json or tsconfig
- Only include rules that prevent mistakes you'd actually make without being told
- If you can delete a line and nothing goes wrong, delete it
- Prefer flat rules lists, zero fluff, pure signal (see https://leerob.com/stack)
- Use `audit-context` skill periodically to trim drift

## Documentation Hierarchy

If the project has enough conventions to exceed ~50 lines in AGENTS.md:

1. Create `docs/conventions.md` with the overflow content (code style, naming, patterns)
2. Create `docs/testing.md` if there are non-obvious testing patterns
3. Add one-line pointers in AGENTS.md's Extended Documentation section
4. Keep AGENTS.md itself lean — rules, quick reference, and pointers only

The goal: AGENTS.md is always loaded (costs context every session). `docs/` is loaded on demand (free until needed).
