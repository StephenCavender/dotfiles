---
name: clarify
description: Socratic interrogation before complex or ambiguous tasks. Surfaces hidden assumptions, unspoken constraints, and framing errors before acting. Use before architecture decisions, significant feature work, or any task where acting on the wrong interpretation is expensive.
---

# Clarify

Interrogate the task before acting. The goal is not delay — it's avoiding the right thing built in the wrong direction.

## Use when

- The task is architectural or cross-cutting (multiple systems/files)
- The request uses vague language: "improve", "refactor", "add support for", "make it better"
- Two or more reasonable interpretations exist with meaningfully different implementation paths
- Acting on a wrong assumption would be expensive to undo
- You're about to make a decision the user hasn't explicitly approved

## Skip when

Single-file change with a clear outcome · explicit instructions with no ambiguity · user already answered the relevant questions.

## Ask about

Skip anything the request already answers. Ask only what's genuinely unknown — don't interrogate for the sake of process.

1. **Problem** — what does this actually solve, for whom, how often? Is there a simpler version covering 80% of the value? Is there an upstream fix that removes the need entirely?
2. **Scope** — what's in, what's out, what stays untouched even if it looks related? What existing code or patterns should this build on?
3. **Hidden constraints** — unstated timeline, performance targets, team conventions, third-party limits? Approaches off the table for unstated reasons? Who else is affected, and what does this depend on?
4. **Done** — concrete acceptance criteria? How will you know it worked (test, metric, user behavior)? What would make this obsolete in 3–6 months?
5. **Steelman the alternative** — strongest argument against doing this at all right now? What would have to be true for the obvious approach to be wrong? Attempted before — why didn't it work?

## How to ask

Lead with the most consequential unknown — the one where a wrong assumption causes the most rework. Max 2–3 questions per round; ask the rest once answers arrive. Put them in a short block, separated from other analysis, ending with "I'll wait for your answers before planning/implementing."

## After

1. Summarize the confirmed understanding in 2–4 sentences.
2. State remaining assumptions explicitly: "I'm assuming X — tell me if that's wrong."
3. Proceed.

The summary is the last cheap chance for the user to catch a misunderstanding.
