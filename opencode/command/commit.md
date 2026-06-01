---
description: Generate a commit message from the staged diff. Imperative mood, <72 chars subject.
---

Read the staged diff (`git diff --cached`) and write a commit message.

## Format

```
<type>: <subject line, imperative mood, <72 chars>

<optional body: what and why, not how. Wrap at 72 chars.>
```

## Types

- `feat` — new feature
- `fix` — bug fix
- `refactor` — restructure without behavior change
- `docs` — documentation only
- `test` — adding or fixing tests
- `chore` — tooling, deps, CI, config

## Rules

- Read the diff, not just file names. Understand what changed.
- Subject line: imperative mood ("Add X", not "Added X" or "Adds X").
- If there's a related issue/ticket number in branch name or recent context, reference it.
- No body needed for single-concern changes. Add body only when "why" isn't obvious from the subject.
- Never include generated file diffs in your reasoning (lockfiles, built assets).
- Present the message and ask for confirmation before committing.
