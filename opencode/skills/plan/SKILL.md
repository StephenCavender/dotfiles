---
name: plan
description: Produce a structured implementation plan with per-step acceptance criteria. Use after a spec exists but before writing code. Outputs a numbered roadmap that can drive a todo list, and persists it as plan.md next to a task SPEC.md when one exists.
---

# Plan

Turn a spec or request into a step-by-step implementation plan.

## Input

Read the spec (spec.md, issue description, or user request). If no spec exists, ask for one or invoke the `/spec` command first.

## Where the plan goes

- **A `SPEC.md` exists in a task directory** (e.g. `tasks/{slug}/SPEC.md`) → persist the plan as `plan.md` next to it. This is the durable, checkable build script that drives autonomous execution. Use `- [ ]` checkboxes so steps can be ticked off as they complete.
- **The user explicitly asks for a file** → write to the path they name.
- **Otherwise** → write the plan in the conversation only (drives a todo list).

When you persist `plan.md`, it is derived from `SPEC.md`: the spec is the contract (what/why/done), the plan is the execution roadmap (how/in what order). Keep them in sync — if the plan reveals the spec is wrong, fix the spec first, then re-derive.

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
- Persist to `plan.md` when a task `SPEC.md` exists (see "Where the plan goes"); otherwise keep it in the conversation unless the user asks for a file.

## Format

```markdown
# Plan: <short title>

Derived from: SPEC.md

- [ ] **1. <action>**
   Verify: <acceptance criteria>

- [ ] **2. <action>**
   Verify: <acceptance criteria>
   Depends on: #1

...
```

When written to the conversation only, drop the checkboxes and `Derived from` line — a plain numbered list is enough.

## Anti-patterns

- Plans with no verification criteria (just a list of file edits)
- Plans that defer all testing to a final "add tests" step
- Plans that start with scaffolding/boilerplate instead of core logic
- Steps that say "refactor" without specifying what changes
