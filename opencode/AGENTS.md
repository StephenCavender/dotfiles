# opencode/

Commands and skills for OpenCode — copied to `~/.config/opencode/` by `install.sh`.

## Installation

```bash
opencode/install.sh
```

## Where to Add Things

| What | Where |
|------|-------|
| New command | `command/<name>.md` |
| New skill | `skills/<name>/SKILL.md` |

## Gotcha: /docs in .gitignore

Some projects ignore `/docs` for build artifacts (Storybook, typedoc). Agent docs in `docs/*.md` get silently swallowed by git. If `docs/*.md` files aren't showing in `git status`, check `.gitignore` for `/docs` and replace with:

```gitignore
/docs/*
!docs/*.md
```
