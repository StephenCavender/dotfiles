# sketchybar/ — macOS Status Bar

Custom macOS menu bar via [Sketchybar](https://github.com/FelixKratz/SketchyBar). Config, items, and plugins are separate concerns.

## STRUCTURE

```
sketchybar/
├── sketchybarrc    # Main config: bar appearance, defaults, item sourcing
├── items/          # Bar item definitions (what appears, order, click handlers)
│   ├── apple.sh, battery.sh, brightness.sh, cpu.sh, date.sh
│   ├── front_app.sh, memory.sh, time.sh, volume.sh, wifi.sh
├── plugins/        # Event-driven scripts (update item content/color on events)
└── scripts/        # Shared utilities used by plugins
```

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Add new bar item | `items/<name>.sh` + source it in `sketchybarrc` |
| Update item appearance | `items/<name>.sh` |
| Change what data an item shows | `plugins/<name>.sh` |
| Adjust bar-wide settings | `sketchybarrc` |
| Shared helper functions | `scripts/` |

## CONVENTIONS

- Items define the widget (position, label, icon, click script)
- Plugins run on events (mouse click, system events) to update item display
- Items source their plugin via `--script plugins/<name>.sh`
- `sketchybarrc` sources all items via `source "$CONFIG_DIR/items/<name>.sh"`

## ANTI-PATTERNS

- Don't put data-fetching logic in `items/` — that belongs in `plugins/`
- Don't hardcode colors in plugins — define in `sketchybarrc` defaults

## NOTES

- Install: `sketchybar/install.sh` (installs sketchybar via brew, sets up fonts)
- Reload config: `sketchybar --reload`
- Config dir: `~/.config/sketchybar/` (symlinked or copied by install.sh)
