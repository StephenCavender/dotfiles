---
name: clarify
description: Socratic interrogation before complex or ambiguous tasks. Surfaces hidden assumptions, unspoken constraints, and framing errors before acting. Use before architecture decisions, significant feature work, or any task where acting on the wrong interpretation is expensive.
---

# Clarify

Before proceeding with the task at hand, interrogate it. The goal is not to delay — it's to avoid building the right thing in the wrong direction.

## When to invoke this skill

Use `clarify` when:
- The task is architectural or cross-cutting (affects multiple systems/files)
- The request uses vague language: "improve", "refactor", "add support for", "make it better"
- Two or more reasonable interpretations exist with meaningfully different implementation paths
- Acting on a wrong assumption would be expensive to undo
- You notice you're about to make a decision the user hasn't explicitly approved

Do **not** use `clarify` for:
- Single-file changes with a clear outcome
- Explicit instructions with no ambiguity
- Tasks where the user has already answered the relevant questions

---

## The Interrogation Protocol

Work through each category. Skip any question whose answer is already explicit in the request. Ask only what's genuinely unknown — don't interrogate for the sake of process.

### 1. Problem framing
- What problem does this actually solve? Who experiences it, and how often?
- Is there a simpler version of this that covers 80% of the value?
- What would make this request unnecessary — is there an upstream fix that removes the need entirely?

### 2. Scope
- What's in scope vs. out of scope? Where are the hard edges?
- What existing code, systems, or patterns should this build on?
- What should remain untouched, even if it seems related?

### 3. Hidden constraints
- Are there constraints not mentioned — timeline, performance targets, team conventions, third-party limitations?
- Are there technologies or approaches that are off the table for reasons not stated?
- Who else is affected by this change? Are there dependencies on other work?

### 4. Success definition
- What does "done" look like concretely? What's the acceptance criteria?
- How will you know this worked? Is there a test, a metric, a user behavior?
- What would make this plan wrong or obsolete in 3–6 months?

### 5. Steelman the alternative
- What's the strongest argument against doing this at all right now?
- What would you have to believe for the obvious approach to be the wrong one?
- Has this been attempted before? If so, why didn't it work?

---

## How to ask

Don't dump all questions at once. Lead with the most consequential unknown — the one where a wrong assumption would cause the most rework. Ask 2–3 questions maximum per round. If more are needed, ask after the first answers arrive.

Format your questions as a short block, clearly separated from any other analysis:

```
Before I proceed, a few things I want to confirm:

1. [Most consequential unknown]
2. [Second most important]
3. [Optional third if truly needed]

I'll wait for your answers before planning/implementing.
```

---

## After clarification

Once questions are answered (or it's clear enough to proceed without them):

1. Summarize the confirmed understanding in 2–4 sentences: "Based on your answers, here's what I understand the goal to be..."
2. Note any remaining assumptions explicitly: "I'm assuming X — let me know if that's wrong."
3. Proceed with the task.

The summary step matters. It gives the user one more chance to catch a misunderstanding before work begins.
