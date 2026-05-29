# opencode/

Commands and skills for OpenCode — copied to `~/.config/opencode/` by `install.sh`.

## Installation

```bash
opencode/install.sh                 # personal mode (default)
opencode/install.sh --mode work     # adds work skills (otto/TeleVet)
```

Mode is saved to `~/.config/opencode/.mode` and reused on next run.

## Where to Add Things

| What | Where |
|------|-------|
| New command | `command/<domain>/<name>.md` |
| Shared skill | `skills/shared/<name>/SKILL.md` |
| Personal-only skill | `skills/personal/<name>/SKILL.md` |
| Work-only skill | `skills/work/<name>/SKILL.md` |

Work skills for the otto workspace also live in `otto/.opencode/skills/` (project-local).

## Gotcha: /docs in .gitignore

Some projects ignore `/docs` for build artifacts (Storybook, typedoc). Agent docs in `docs/*.md` get silently swallowed by git. If `docs/*.md` files aren't showing in `git status`, check `.gitignore` for `/docs` and replace with:

```gitignore
/docs/*
!docs/*.md
```
