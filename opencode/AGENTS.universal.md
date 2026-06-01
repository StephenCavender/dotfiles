# Universal Rules

Rules that apply to every project. Born from actual mistakes.

## Code Quality

- Never suppress type errors (`as any`, `@ts-ignore`, `@ts-expect-error`)
- Never leave empty catch blocks — handle or rethrow
- Never delete failing tests to make a build pass
- Fix bugs minimally — don't refactor while fixing

## Agent Behavior

- Read existing code for patterns before inventing new ones
- Every rule in an AGENTS.md must come from an actual failure — no speculative rules
- If a project has `docs/`, check it before asking
- Ask if genuinely ambiguous — don't guess on architecture
- When two approaches are equivalent, pick the simpler one

## Workflow

- Write or update tests for any behavior change
- Run linting/typecheck after edits — don't declare done with errors
- Commit messages: imperative mood, <72 chars, reference issue if one exists
- Never commit secrets, tokens, or credentials
