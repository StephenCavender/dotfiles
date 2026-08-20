# Coding Philosophy

How I think about code — whether I write it or agents do. Derived from practice.

---

## Code Values

### Principles
- **Readability > performance** — optimize later if profiling demands it
- **Single responsibility** — one reason to change; hill to die on
- **Self-documenting code** — comments are smell; if you need one, rename first
- **Type strict** — no `any`, no `@ts-ignore`, no escape hatches

### Naming & Style
- camelCase, verb/noun pairs, descriptive over brief
- Automate all formatting/linting — no bikeshedding
- No magic strings/numbers

### Abstraction
- Extract at 3 occurrences, not before
- Dependencies: case-by-case (functionality + licensing)

### Code Smells (Review Priorities)
1. Duplicate code
2. Long methods
3. Long parameter lists
4. Dead code

### Error Handling
- Fail fast
- Log every error path

---

## Testing

- **70/20/10 pyramid** — unit/integration/e2e, flexible by context
- Cover critical paths, skip trivial
- TDD when it fits; test-after when exploring
- Heavy mock 3rd party services; integration tests when cheap to run
- Every bug fix gets a regression test

---

## Git & PRs

- Single master, feature branches off and back
- Atomic conventional commits (`feat|fix|chore|refactor(scope): msg`)
- Smaller PRs — easier to review, easier to revert
- Reviews: hunt smells + business logic bugs; CI handles compilation/units

---

## Tech Debt & Refactoring

- Opportunistic — boy scout rule (leave it better)
- Separate refactor PRs from feature PRs
- Legacy: incremental strangler; rewrite only if codebase is small

---

## Collaboration

- **Async-first** — meetings need justification
- **Pair programming** — context-dependent, not default
- **Estimation** — unknowable nonsense; focus on relative sizing if forced

### Agile Ceremonies (valuable if done correctly)
- **Standups**: blockers only, not status reports
- **Retros**: must produce assigned action items or pointless
- **Planning**: breadth over depth; don't rathole on one ticket

---

## Documentation

- README: summary, stack, up/downstream repos, setup instructions
- Keep it current — stale docs are worse than none
- Good README = good onboarding

---

## Side Projects

- Looser standards acceptable — experimentation is the point

---

## Agent Operations

How to get agents to produce code that meets the above values.

### Context is expensive
- Every line in always-loaded files costs tokens every session
- Hierarchical knowledge: lean entry point → on-demand detail
- AGENTS.md is the index (~30 lines); `docs/` is the library
- If you can delete a line and nothing breaks, delete it

### Scar tissue only
- Rules from actual failures, not imagined ones
- "Follow SOLID" teaches nothing — the model knows SOLID
- "Never import from @chakra-ui/react directly" prevents a real mistake
- Capability lists and personality roleplay are context poison

### Specs + tests > prompting tricks
- Spec (what, why, acceptance criteria) before code prevents drift
- Tests are machine-verifiable acceptance criteria
- Verifiable constraints, not personality instructions

### Tight loops
- Define → Execute → Verify in 15-minute cycles
- Small batches with verification between each
- When stuck, re-ground in actual code

### Trust but verify
- Let agents run, validate against tests + linting
- Maximally strict: type-check, lint, compile, static analysis as fail-fast gates
- Agents write tests, run suites, fix what they break
- Read existing code for patterns before inventing new ones
- Fix minimally — don't refactor while fixing bugs

### Curation compounds
- Docs maintained every commit, not written once
- Keep codebase opinionated: well-named symbols, small files, flat folders
- Speed is intoxicating — unchecked sprawl is debt

### The system is the leverage
- Don't babysit — improve the system that keeps agents honest
- Cross-review: one model reviews another's work
- Running agents unattended exposes every weak gate
- Hand-write occasionally — stay in tune with what you're steering
