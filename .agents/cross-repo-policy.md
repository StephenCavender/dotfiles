# Cross-repo policy

Rules true in every repo. Policy by design, not observed failures, which is why this is a doc and not an `AGENTS.md` rule. Canonical copy lives here and loads globally via `AGENTS.universal.md`; destination is a shared location once agreed. Repo `AGENTS.md` files never restate anything here.

Review by: 2026-12-16.

## Small diffs

- One reviewable concern per PR. One ticket = one PR, unless the ticket's `SPEC.md` `## Plan` names reviewable seams; then one PR per plan row, in dependency order. Never combine concerns.
- Target under 300 changed lines, excluding lockfiles and generated code.
- Above 500 changed lines, stop and split. Do not open the PR; propose the split first. If the ceiling is visible before code is written, split then. Mid-implementation discovery is the expensive case.
- Roughly 15 files touched. More than 3 new files needs a flag before creating them.
- No drive-by refactors. Out-of-scope problems get a tech-debt marker, not a fix.

## Tech-debt markers

Format, using the language's own comment token:

```
// TECH-DEBT(scope): description
```

- `scope` is the module, package, or system the debt belongs to, not the ticket that found it.
- `description` says what is wrong and roughly what fixing it takes, in one line.
- Task work flags debt but never folds it in. Debt adjacent to the change is not permission to fix it in that PR. Mark it, name it once in the PR description, move on.
- Deliberate shortcut with a known ceiling: `// TECH-DEBT(scope): <ceiling>; <upgrade path>`, e.g. `// TECH-DEBT(billing): global lock; per-account locks if throughput matters`.
- Existing markers in a file you touch stay untouched unless the task is that debt.
- A marker is not a ticket. Debt that blocks something gets a ticket, and the marker cites it: `// TECH-DEBT(inform-sync): ... see CU-86exxxxx`.

## Review tier

Placeholder. To be filled from a later session.

Shape: which review a PR gets (self, AI cross-review, human, senior) and what decides it (diff size, blast radius, surface touched). Inputs in the otto workspace: `docs/agent-rigor-modes.md` levers, `pr:review-inbox` model-per-PR selection, `code:cross-review`, the former 1,000-line senior-review flag from `docs/content-caps.md`.

## PR package

- Description at most 200 words: 1-2 sentences what, 2-3 sentences why, at most 5 how-to-test bullets. No file-by-file tables, no restating the diff, no review-tool transcripts.
- UI change: one screenshot or preview link, non-negotiable.
- Any `TECH-DEBT` markers added: listed once in the description.
- Draft by default. One PR per repo.
- Commits: Conventional Commits, subject at most 72 chars, imperative, body at most 5 lines and only when the why is not obvious.

## Code quality and safety

- Before new code, climb: needed at all? → already in this codebase? → stdlib? → platform feature? → installed dep? → one line? → minimum that works. Never add a dependency for what a few lines do. Never simplify away validation at trust boundaries, error handling that prevents data loss, or security.
- Bug fix = root cause where all callers route through, not a guard in the caller the ticket names. Grep callers first.
- Never suppress type errors (`as any`, `@ts-ignore`, `@ts-expect-error`).
- Never leave an empty catch block. Handle or rethrow.
- Never delete or weaken a failing test to make a build pass.
- Every behavior change ships with a test that exercises the changed path. A test file merely existing is not coverage.
- Run lint and typecheck after edits. Never declare done with errors.
- Before writing a helper, grep for an existing one. Extract shared logic instead of copy-pasting it across files.
- Name things for what they do, not how. A reader who has not seen the diff should understand the call site.
- Never commit secrets, tokens, or credentials. Never push to main or master directly.
