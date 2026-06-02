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
- When a problem slips through, feed the fix back into docs, tests, or specs so it never recurs

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
- Be maximally strict: type-check, lint, compile, static analysis as fail-fast gates
- Agents write their own tests, run the full suite, and fix what they break
- Read existing code for patterns before inventing new ones
- Fix minimally — don't refactor while fixing bugs

## Curation compounds

- Docs (systems, code style, testing strategy) are maintained every commit/PR, not written once
- Keep the codebase opinionated: well-named symbols, small files, flat folders
- Speed is intoxicating — unchecked sprawl is debt you pay back with interest

## The system is the leverage

- Don't babysit the agent — improve the system that keeps it honest (tests, checklists, review gates)
- Cross-review: have one model review another's work; require a review checklist before "done"
- Running agents unattended is a forcing function — it exposes every weak gate
- Hand-write a feature or bugfix occasionally — stay in tune with the codebase you're steering

## Distribution model

```
AGENTS.universal.md     → Hard rules for ALL projects (installed globally)
AGENTS.template.md      → Scaffold for new project-local AGENTS.md
project/AGENTS.md       → Project-specific rules (non-obvious, earned)
project/docs/           → On-demand detail (conventions, decisions, patterns)
skills/                → Reusable workflows (installed globally)
command/                → One-shot operations (installed globally)
```

## Sources

This philosophy is synthesized from practitioners working in the open:

- Jamon Holmgren — [The eight best ways I've improved my AI agent's code](https://jamon.dev/8ways)
- Harper Reed — [Waterfall in 15 minutes](https://harper.blog/2025/04/10/waterfall-in-15-minutes-or-your-money-back/) · [My LLM codegen workflow](https://harper.blog/2025/02/16/my-llm-codegen-workflow-atm/) · [Basic Claude Code](https://harper.blog/2025/05/08/basic-claude-code/) · [Email, productivity, MCP agents](https://harper.blog/2025/12/03/claude-code-email-productivity-mcp-agents/) · [An LLM codegen hero's journey](https://harper.blog/2025/04/17/an-llm-codegen-heros-journey/) · [Auto-generate git commit messages](https://harper.blog/2024/03/11/use-an-llm-to-automagically-generate-meaningful-git-commit-messages/) · [AI agents & social media](https://harper.blog/2025/09/30/ai-agents-social-media-performance-lambo-doomscrolling/) · [Claude Code on your phone](https://harper.blog/2026/01/05/claude-code-is-better-on-your-phone/)
- Lee Robinson — [Stack](https://leerob.com/stack) · [Agents](https://leerob.com/agents) · [Pixo](https://leerob.com/pixo) · [AI](https://leerob.com/ai) · [Personal software](https://leerob.com/personal-software)
- Peter Steinberger — [Just talk to it](https://steipete.me/posts/just-talk-to-it) · [Shipping at inference speed](https://steipete.me/posts/2025/shipping-at-inference-speed) · [agent-scripts](https://github.com/steipete/agent-scripts) · [CLAUDE.md gist](https://gist.github.com/steipete/d3b9db3fa8eb1d1a692b7656217d8655)
- byme8 — [You don't need a CLAUDE.md](https://dev.to/byme8/you-dont-need-a-claudemd-jgf)
