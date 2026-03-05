# opencode/ — AI Agent & Command Toolkit

Specialized agents and slash commands for opencode. Install to `~/.config/opencode/` via `install.sh` (currently disabled — copy manually).

## STRUCTURE

```
opencode/
├── agent/          # Agent definitions by domain
│   ├── architecture/   # backend-architect, database-architect, sql-specialist, system-architect
│   ├── content/        # content-editor, documentation-specialist, prompt-engineer, reference-builder
│   ├── design/         # ui-ux-designer, ui-visual-validator
│   ├── developer-experience/  # dx-optimizer
│   ├── engineering/    # frontend-engineer, mobile-engineer
│   ├── ops/            # deployment-engineer, performance-analyst, security-auditor, terraform-specialist
│   ├── orchestration/  # workflow-orchestrator
│   └── quality/        # accessibility-engineer, code-reviewer, test-automation-engineer
└── command/        # Slash commands by domain (mirror agent domains + meta/)
    ├── quality/        # analyze, review, refactor, bug-fix, improve, explain, test-plan, write-tests, tech-debt, remove-slop, a11y-audit
    ├── orchestration/  # build, hotfix, invoke, new-feature, plan
    ├── ops/            # optimize, performance-audit, security-audit, terraform
    ├── content/        # critique, document, edit, polish, prompt, reference
    ├── engineering/    # be, fe, mobile
    ├── architecture/   # arch, sql
    ├── design/         # design-system, visual-test
    └── meta/           # session-summary
```

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Add new specialist agent | `agent/<domain>/<name>.md` |
| Add new slash command | `command/<domain>/<name>.md` |
| Code review / analysis | `command/quality/` |
| Planning / feature work | `command/orchestration/` |
| Performance / security | `command/ops/` |
| Frontend / backend work | `command/engineering/` |
| Documentation | `command/content/` |

## CONVENTIONS

- Agent files are Markdown with YAML frontmatter or structured prompt sections
- Command files invoke agents — one command maps to one primary agent
- Domain folders must match between `agent/` and `command/` where applicable
- New domains need a folder in both `agent/` and `command/`

## ANTI-PATTERNS

- `install.sh` is currently disabled (skips curl install) — manually copy agent/ and command/ to `~/.config/opencode/` if needed
- Don't add commands without a corresponding agent definition
- Don't put project-specific agents here — these are generic toolkit agents

## NOTES

- Agents install to `~/.config/opencode/agent/` and `~/.config/opencode/command/`
- The `meta/` command domain has no corresponding agent (meta commands are self-contained)
