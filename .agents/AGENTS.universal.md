# Universal Rules

Rules that apply to every project. Born from actual mistakes.

## Code Quality

- Never suppress type errors (`as any`, `@ts-ignore`, `@ts-expect-error`)
- Never leave empty catch blocks — handle or rethrow
- Never delete failing tests to make a build pass
- Fix bugs minimally — don't refactor while fixing
- Before writing a new helper, grep for an existing one — extract shared logic instead of copy-pasting it across files
- Name things for what they do, not how — a reader who hasn't seen the diff should understand the call site

## Agent Behavior

- No emojis in code, comments, commit messages, or any written output unless the user explicitly asks
- Read existing code for patterns before inventing new ones
- Every rule in an AGENTS.md must come from an actual failure — no speculative rules
- If a project has `docs/`, check it before asking
- Apply the colleague test before acting on a vague request — if a new teammate with only this context would be confused, ask one clarifying question first
- Ask if genuinely ambiguous — don't guess on architecture
- When two approaches are equivalent, pick the simpler one
- Match communication density to stakes — be terse for routine work, be explicit and unambiguous for security warnings, destructive operations, and irreversible actions

## Workflow

- Write or update tests for any behavior change
- Run linting/typecheck after edits — don't declare done with errors
- Commit messages: `feat|fix|chore|refactor(scope): message`, imperative mood, <72 chars, reference issue if one exists
- Never commit secrets, tokens, or credentials
