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

- Under 50 lines total
- No "where to look" tables — you can explore the codebase yourself
- No linting/formatting rules — those belong in eslint/prettier configs
- No role definitions — don't tell yourself what you are
- Don't document things inferable from reading package.json or tsconfig
- Only include rules that prevent mistakes you'd actually make without being told
