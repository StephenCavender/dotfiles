# Philosophy

How we think about agent-assisted development. Derived from practice, not theory.

## Context is expensive

- Every line in an always-loaded file (AGENTS.md) costs tokens every session
- Project knowledge should be hierarchical: lean entry point → on-demand detail
- AGENTS.md is the index (~30 lines). `docs/` is the library (loaded when needed)
- If you can delete a line and nothing goes wrong, delete it

## Scar tissue only

- Rules come from actual failures, not imagined ones
- "Follow SOLID principles" teaches nothing — the model already knows SOLID
- "Never import from @chakra-ui/react directly — use subpaths" prevents a real mistake
- Capability lists, role definitions, and personality roleplay are context poison

## Specs + tests > prompting tricks

- A spec (what, why, acceptance criteria) before code prevents drift
- Tests are machine-verifiable acceptance criteria — they catch hallucinations immediately
- Give agents verifiable constraints, not personality instructions

## Tight loops

- Define → Execute → Verify in 15-minute cycles (Harper's micro-waterfall)
- Small batches with verification between each, not one giant prompt
- When stuck, re-ground in actual code — don't keep prompting into the void

## Trust but verify

- Let agents run, then validate output against tests + linting
- Read existing code for patterns before inventing new ones
- Fix minimally — don't refactor while fixing bugs

## Distribution model

```
AGENTS.universal.md     → Hard rules for ALL projects (installed globally)
AGENTS.template.md      → Scaffold for new project-local AGENTS.md
project/AGENTS.md       → Project-specific rules (non-obvious, earned)
project/docs/           → On-demand detail (conventions, decisions, patterns)
skills/                 → Reusable workflows (installed globally)
command/                → One-shot operations (installed globally)
```
