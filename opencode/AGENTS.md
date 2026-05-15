# opencode/ — AI Agent & Skill Toolkit

Agents, commands, and skills for OpenCode. Installed to `~/.config/opencode/` via `opencode/install.sh`.

## Structure

```
opencode/
├── agent/              # Specialist agents by domain (always installed)
├── command/            # Slash commands by domain (always installed)
└── skills/             # Skills separated by mode
    ├── shared/         # Always installed (refine, etc.)
    ├── personal/       # Installed with `dot --mode personal`
    └── work/           # Installed with `dot --mode work`
```

## Installation

```bash
dot --mode personal    # Side projects — shared agents + personal skills
dot --mode work        # Otto/TeleVet — shared agents + work skills
dot                    # Uses last saved mode (default: personal)
```

Mode is saved to `~/.config/opencode/.mode` and persists between runs.

## Adding agents/skills

| What | Where |
|------|-------|
| New agent | `agent/<domain>/<name>.md` |
| New command | `command/<domain>/<name>.md` |
| Shared skill | `skills/shared/<name>/SKILL.md` |
| Personal-only skill | `skills/personal/<name>/SKILL.md` |
| Work-only skill | `skills/work/<name>/SKILL.md` |

Work-specific skills for the otto workspace also live in `otto/.opencode/skills/` (project-local, not global).
