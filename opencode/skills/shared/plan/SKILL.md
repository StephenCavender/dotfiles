---
name: plan
description: Produce a structured implementation plan with per-step acceptance criteria. Use after a spec exists but before writing code. Outputs a numbered roadmap that can drive a todo list.
---

# Plan

Turn a spec or request into a step-by-step implementation plan.

## Input

Read the spec (spec.md, issue description, or user request). If no spec exists, ask for one or invoke the `/spec` command first.

## Output

Produce a plan as a numbered list. Each step must have:

1. **What** — one atomic action (create file, modify function, add test)
2. **Acceptance** — how to verify this step is done (test passes, type checks, output matches)
3. **Dependencies** — which prior steps must be complete first (if any)

## Rules

- Each step should be completable in one focused pass (5-15 min of agent work)
- If a step feels too big, split it. If it feels trivial, merge it with the next.
- Order steps so the project builds incrementally — never broken between steps
- First step should always be the hardest or riskiest (fail fast)
- Include a test step for every behavior change — don't defer all testing to the end
- Don't plan more than 10 steps. If you need more, the scope is too big — split into phases.
- Write the plan in the conversation, not to a file, unless the user asks for a file.

## Format

```markdown
## Plan: <short title>

1. **<action>**
   Verify: <acceptance criteria>

2. **<action>**
   Verify: <acceptance criteria>
   Depends on: #1

...
```

## Anti-patterns

- Plans with no verification criteria (just a list of file edits)
- Plans that defer all testing to a final "add tests" step
- Plans that start with scaffolding/boilerplate instead of core logic
- Steps that say "refactor" without specifying what changes
