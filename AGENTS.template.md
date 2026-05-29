# AGENTS.md

<!-- Replace this comment with one sentence: what this repo is and what it does. -->

## Quick Reference

| Task | Location |
|------|----------|
| <!-- common task --> | <!-- path --> |

## Critical Mechanics

<!-- Non-obvious behaviors an agent will get wrong without being told.
     Examples: generated files that must not be edited, side-effect imports,
     non-standard directory layouts, required post-change commands. -->

## Stack

<!-- List the actual technologies in use. Let tooling configs (eslint, tsconfig,
     prettier) speak for themselves — don't repeat their rules here. -->

## Commands

```bash
# dev        # Start dev server
# build      # Production build
# test       # Run tests
# lint       # Lint + format check
# typecheck  # Type check
```

## Anti-Patterns

<!-- Rules that agents violate most often in this codebase.
     Be specific — name the file, pattern, or mistake.
     ❌ "Don't use any" — too generic, inferable from tsconfig
     ✅ "Never import from @chakra-ui/react directly — use subpaths" — specific, non-obvious
     ✅ "Never use prisma for reads — use prismaRead from utils" — project-specific gotcha
-->

## When Stuck

- Read existing code for patterns before inventing new ones
- Check `docs/` if the folder exists
- Ask if genuinely ambiguous — don't guess on architecture

## Extended Documentation

<!-- Keep this file under ~100 lines. If a section exceeds ~10 lines of
     procedure, extract it to docs/ and leave a one-line pointer here.
     Example:
     - **Conventions**: `docs/conventions.md` — code style, naming, patterns
     - **Testing**: `docs/testing.md` — test framework, patterns, commands
     - **Patterns**: `docs/patterns.md` — common implementation patterns
-->
