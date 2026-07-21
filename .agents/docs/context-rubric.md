# Context Rubric

Graded scoring for agent-facing files (AGENTS.md, skills, commands, docs). Turns the philosophy into repeatable verdicts. Load when auditing or writing agent docs.

Derived from `philosophy.md` (context is expensive, scar tissue only) and the caveman density rules.

## Core test (non-negotiable)

Every line faces one filter:

> "Delete this line — does the model produce worse output?"

- YES → keep.
- NO or UNSURE → cut. Add back when the mistake actually happens.

The dimensions below grade what survives and decide trim vs. rewrite vs. delete.

## Five dimensions (score each 0–2)

| # | Dimension | 0 | 1 | 2 |
|---|-----------|---|---|---|
| 1 | **Scar tissue** — rules earned from real failures | Generic best practices (SOLID, "write clean code") | Mix of earned + generic | Every line prevents a specific, non-obvious mistake |
| 2 | **No poison** — no roleplay, capability lists, personality, role defs | Multiple poison sections | Some flavor text | Zero. Constraints + facts only |
| 3 | **Density** — terse signal, no filler | Prose paragraphs, hedging | Readable but wordy | `[thing][action][reason]`. Fluff cut |
| 4 | **Placement** — cost matches load frequency | Detail in always-loaded file | Some misplacement | Always-loaded = index; detail on-demand |
| 5 | **Output constraint** (skills/subagents; else N/A) | Unbounded essay output | Loose | Format constrained (paths + one-liners) |

## Verdict from total

- **8–10** → KEEP, minor trims
- **5–7** → REWRITE / restructure
- **0–4** → CUT hard or delete
- Any **0 on dim 1 or 2** → mandatory REWRITE regardless of total. Poison and generic advice are disqualifying.
- File below ~5 useful lines after cuts → delete entirely.

## Never-compress guard

Density (dim 3) never applies to: **code, commands, quoted errors, identifiers, security/destructive warnings, acceptance criteria**. These stay verbatim even if verbose. Compressing them risks misread — disqualified.

## Skill / command extras (beyond the 5 dims)

- **Frontmatter `description`** is the only always-loaded part → must carry concrete trigger phrases, not vague capability claims. Bad: "handles data tasks". Good: "when asked to 'query the database', 'how many X', 'check prod'".
- **Body loads on demand** → may be longer, but still scar-tissue-gated.
- **Nested AGENTS.md** → only content that contradicts or extends the root. Restating "follow good practices" → delete.

## Per-file audit output

```
FILE: path (lines: N, load: always|on-demand)
Scores: [scar:_ poison:_ density:_ placement:_ output:_] = _/10
Verdict: KEEP | REWRITE | CUT
Cuts: <lines/sections to remove>
Rewrite: <replacement if applicable>
```

## Target

A good audit removes 60–90% of noise from failing files. Under 50% on a file scored ≤4 means you weren't aggressive enough.
