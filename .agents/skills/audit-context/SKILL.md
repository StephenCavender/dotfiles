---
name: audit-context
description: Audit agent instructions (AGENTS.md, CLAUDE.md, skills, commands) for bloat, slop, and context waste. Trims or deletes anything that doesn't earn its tokens. Use on existing projects to reduce context tax.
---

# Audit Context

Cut anything in this project's agent-facing files that costs tokens without preventing a real mistake.

## The test (non-negotiable)

Every line faces one filter:

> "Delete this line — does the model produce worse output?"

- YES → keep.
- NO or UNSURE → cut. Add it back when the mistake actually happens.

## Cut on sight

Role definitions · capability lists · knowledge-base sections · behavioral traits · generic best practices ("follow SOLID", "write maintainable code") · output-format scaffolding the model ignores · collaboration protocols ("when called by Security Auditor...") · example interactions · framework jargon (Markov states, DAGs, "atomic convergence").

## Keep

- Constraints the model would violate without being told
- Non-obvious patterns that differ from defaults ("use prismaRead for queries, not ctx.db")
- Do/Don't rules born from actual failures ("Don't delete StripePaymentIntent records — protected")
- Commands the model needs, when non-standard
- Architecture decisions overriding model defaults ("Server Components by default — 'use client' only when needed")
- Deprecated paths the model might reach for ("v3 audiences are deprecated — use v4")

## Score what survives (0–2 each)

| # | Dimension | 0 | 1 | 2 |
|---|-----------|---|---|---|
| 1 | **Scar tissue** — rules earned from real failures | Generic best practices | Mix of earned + generic | Every line prevents a specific, non-obvious mistake |
| 2 | **No poison** — no roleplay, capability lists, role defs | Multiple poison sections | Some flavor text | Zero. Constraints + facts only |
| 3 | **Density** — terse signal | Prose paragraphs, hedging | Readable but wordy | `[thing][action][reason]`. Fluff cut |
| 4 | **Placement** — cost matches load frequency | Detail in an always-loaded file | Some misplacement | Always-loaded = index; detail on-demand |
| 5 | **Output constraint** (skills/commands; else N/A) | Unbounded essay output | Loose | Constrained format (paths + one-liners) |

Verdict: **8–10** KEEP with minor trims · **5–7** REWRITE · **0–4** CUT hard or delete. Any **0 on dim 1 or 2** → mandatory REWRITE regardless of total. Below ~5 useful lines after cuts → delete the file.

**Never compress**: code, commands, quoted errors, identifiers, security/destructive warnings, acceptance criteria. These stay verbatim even when verbose — compressing them risks misread.

## Skills and commands

- Frontmatter `description` is the only always-loaded part → concrete trigger phrases, not capability claims. Bad: "handles data tasks". Good: "when asked to 'query the database', 'how many X', 'check prod'".
- Body loads on demand → may run longer, still scar-tissue-gated.
- Nested AGENTS.md → only what contradicts or extends the root. Restating "follow good practices" → delete.

## Process

1. Find agent-facing files: `AGENTS.md`, `CLAUDE.md`, `.rules`, `.cursor/rules/*`, `.agents/skills/*`, `opencode/command/*`, `docs/*.md`.
2. Cost each: **lines × load frequency**. Always-loaded lines are expensive; on-demand lines are near-free.
3. Score, verdict, cut.
4. Check for orphans (files nothing references), duplicated rules across files, and paths that no longer exist. Stale pointers are worse than bloat — the agent acts on them.

## Report

```
FILE: path (lines: N, load: always|on-demand)
Scores: [scar:_ poison:_ density:_ placement:_ output:_] = _/10
Verdict: KEEP | REWRITE | CUT
Cuts: <lines/sections removed>
```

Then totals: files audited, files deleted, lines before → after, percent reduction. A good audit removes 60–90% from failing files. Under 50% on a file scored ≤4 means you weren't aggressive enough.
