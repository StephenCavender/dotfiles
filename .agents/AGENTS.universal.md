# Universal Rules

Rules that apply to every project. Born from actual mistakes.

## AI-Assisted Development Philosophy

AI is autocomplete on steroids — a tool, not a partner. It accelerates; humans own.

### Core Principles

- **Human primacy**: Code must be readable and maintainable by humans without AI assistance
- **Small tasks default**: Less context, faster loops, cheaper mistakes
- **Specs persist with code**: `docs/specs/` in-repo, or it rots

### Process: Spec → Plan → Impl → Review → Test → Deploy

Iterate at any step, even on small tasks.

- **Spec depth**: Acceptance criteria — inputs/outputs, constraints, error cases, out-of-scope. Not user stories (too thin), not pseudo-code (too thick)
- **Circuit breaker**: 3 attempts max, then human takes over
- **Architecture boundary**: Everything fair game with sufficient spec

### Testing

- **Standard**: TDD — tests before implementation
- **Coverage**: Local pre-push hook, not in CI pipeline
- **Layers**: Unit → Contract → Integration → System (all, always)

### Review

- **Bar**: Reviewer must explain any function without running it
- **Authority**: Human approves all, owns all

### Knowledge Capture

- **What/How**: Self-documenting code + inline comments where code can't
- **Why**: Specs in `docs/specs/`, versioned with code

### Refactoring

- **When**: When it causes pain, not preemptively
- **Who**: Anyone — human or AI
- **Gate**: Human approval required

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
- Before multi-step work, restate what "done" looks like in 1-3 bullets — confirm with the user before starting
- Commit messages: `feat|fix|chore|refactor(scope): message`, imperative mood, <72 chars, reference issue if one exists
- Never commit secrets, tokens, or credentials
- Never push to main/master directly
- Never overwrite existing conventions without explicit approval

## Ask First (pause and confirm)

- Architecture decisions affecting multiple systems
- Adding new dependencies
- Deleting files or removing features
- Changes that cross module boundaries
- Choosing between two reasonable approaches with different tradeoffs
