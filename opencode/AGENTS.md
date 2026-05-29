# opencode/

Agents, commands, and skills for OpenCode — copied to `~/.config/opencode/` by `install.sh`.

## Installation

```bash
opencode/install.sh                 # personal mode (default)
opencode/install.sh --mode work     # adds work skills (otto/TeleVet)
```

Mode is saved to `~/.config/opencode/.mode` and reused on next run.

## Where to Add Things

| What | Where |
|------|-------|
| New agent | `agent/<domain>/<name>.md` |
| New command | `command/<domain>/<name>.md` |
| Shared skill | `skills/shared/<name>/SKILL.md` |
| Personal-only skill | `skills/personal/<name>/SKILL.md` |
| Work-only skill | `skills/work/<name>/SKILL.md` |

Work skills for the otto workspace also live in `otto/.opencode/skills/` (project-local).
