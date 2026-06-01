---
name: tdd-loop
description: Test-driven development loop. Write a failing test first, implement until it passes, then clean up. Use for any behavior change where correctness matters.
---

# TDD Loop

For the current task, follow a strict red-green-refactor cycle.

## The Loop

### 1. Red — Write the test first

- Write a test that describes the desired behavior
- Run it — confirm it fails (red)
- If you can't write the test, the requirement isn't clear enough. Stop and clarify.

### 2. Green — Minimal implementation

- Write the minimum code to make the test pass
- No cleverness, no optimization, no "while I'm here" changes
- Run the test — confirm it passes (green)

### 3. Refactor — Clean up

- Improve the implementation without changing behavior
- Run tests again — still green
- Only refactor if the code is genuinely unclear. "Good enough" is fine.

### 4. Repeat

Move to the next behavior. Each loop should take 5-15 minutes.

## Rules

- Never write implementation before the test exists
- Never skip the "run and confirm it fails" step — false greens are worse than no tests
- One behavior per test. If a test name has "and" in it, split it.
- Test the interface, not the implementation. Tests shouldn't break on refactors.
- If existing tests already cover the behavior, skip to implementation — don't write redundant tests

## When to use this skill

- Adding a new feature or endpoint
- Fixing a bug (write a test that reproduces it first)
- Any change where "did it break something?" is a real concern

## When NOT to use this skill

- Pure refactors with existing test coverage
- Config changes, documentation, or tooling
- Prototyping / exploratory code that will be thrown away
