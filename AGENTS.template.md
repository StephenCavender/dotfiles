# AGENTS.md

<!-- One sentence: what this repo is. -->

<!-- Package manager, only if not the ecosystem default: e.g. "Use pnpm, never npm." -->

## Critical Mechanics

<!-- Non-obvious behaviors an agent will get wrong without being told.
     Examples: generated files that must not be edited, side-effect imports,
     non-standard directory layouts, required post-change commands.
     Avoid listing file paths; they go stale. -->

## Commands

```bash
# dev        # Start dev server
# build      # Production build
# test       # Run tests
# lint       # Lint + format check
# typecheck  # Type check
```

## Anti-Patterns

<!-- Every rule here must come from an actual mistake. If you haven't seen the
     failure, don't add the rule. Be specific: name the pattern or mistake.
     ❌ "Don't use any" (too generic, inferable from tsconfig)
     ✅ "Never import from @chakra-ui/react directly; use subpaths"
-->

## Extended Documentation

<!-- Loaded every session; keep this file under 50 lines. Move detail to docs/
     and link one line each, only for files that exist. Monorepo: put
     package-specific rules in packages/<pkg>/AGENTS.md. -->
