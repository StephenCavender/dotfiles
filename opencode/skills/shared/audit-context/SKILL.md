---
name: audit-context
description: Audit agent instructions (AGENTS.md, CLAUDE.md, skills, commands) for bloat, slop, and context waste. Trims or deletes anything that doesn't earn its tokens. Use on existing projects to reduce context tax.
---

# Audit Context

Review all agent-facing files in this project and ruthlessly cut anything that wastes context without preventing real mistakes.

## Philosophy

From https://steipete.me/posts/just-talk-to-it:
- Telling a model "You are an expert X specializing in Y" changes nothing. The model already has that knowledge.
- Capability lists are context poison — they consume tokens without improving output.
- What helps: documentation, examples, do/don't rules. What doesn't: personality roleplay.
- MCPs that dump 23k tokens of tool descriptions are waste; CLIs the model already knows are free.
- Agent files should be "organizational scar tissue" — earned through actual mistakes, not imagined ones.

From https://leerob.com/stack:
- An entire AGENTS.md can be ~20 lines of actual rules.
- No roleplay, no capability lists. Just constraints and project-specific facts.
- "React Compiler is enabled, skip manual useMemo" — things the model would get wrong without being told.

## The Test

For every line in an agent instruction file, apply this filter:

> "If I delete this line, will the model produce worse output?"

- If YES → keep it. It's preventing a real mistake.
- If NO → delete it. It's context tax.
- If UNSURE → delete it. You can always add it back when the mistake actually happens.

## What to Cut

- **Capability lists** ("Masters RESTful APIs, GraphQL, event-driven architecture...")
- **Role definitions** ("You are an expert backend architect specializing in...")
- **Generic best practices** ("Follow SOLID principles", "Write maintainable code")
- **Output format templates** (200-line response scaffolding the model will ignore anyway)
- **Collaboration protocols** ("When Called by Security Auditor, implement...")
- **Knowledge base sections** ("Deep expertise in React, TypeScript, CSS...")
- **Behavioral traits** ("Communicates technical decisions clearly with rationale")
- **Example interactions** ("Design a RESTful API for a multi-tenant e-commerce system")
- **AOT/framework jargon** (Markov states, DAGs, "atomic convergence" — pure noise)

## What to Keep

- **Project-specific constraints** the model would violate without being told
- **Non-obvious patterns** that differ from common defaults (e.g., "use prismaRead for queries, not ctx.db")
- **Do/Don't rules** born from actual mistakes ("Don't delete StripePaymentIntent records — protected")
- **Commands** the model needs to run (build, test, lint — but only if non-standard)
- **Architecture decisions** that override the model's defaults ("Server Components by default — 'use client' only when needed")
- **Deprecated paths** the model might use ("v3 audiences are deprecated — use v4")

## Process

1. Find all agent-facing files:
   ```
   AGENTS.md, CLAUDE.md, .cursor/rules/*, .opencode/skills/*, docs/conventions.md
   ```

2. For each file, measure: **lines × frequency of loading = context cost**.
   - AGENTS.md loads every session — every line is expensive
   - docs/*.md loads on demand — lines there are cheap

3. Apply the test to each section. Cut aggressively.

4. If a file drops below ~5 useful lines → delete it entirely.

5. If a file has signal buried in noise → extract the signal, delete the rest.

6. After cutting, check: are there nested AGENTS.md files that duplicate the root?
   - Subdirectory AGENTS.md should ONLY contain info that contradicts or extends the root
   - If it's just restating "follow good practices" → delete it

## Metrics

Report at the end:
- Files audited: N
- Files deleted: N
- Lines before: N
- Lines after: N
- Net reduction: N lines (X%)

A good audit removes 60-90% of existing context. If you removed less than 50%, you weren't aggressive enough.
