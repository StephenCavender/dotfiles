# sketchybar/ — macOS Status Bar

Custom macOS menu bar via [Sketchybar](https://github.com/FelixKratz/SketchyBar).

## Conventions

- `items/<name>.sh` defines a widget (position, label, icon, click script); it sources its plugin via `--script plugins/<name>.sh`
- `plugins/<name>.sh` runs on events to update item display — data-fetching logic lives here, not in `items/`
- `sketchybarrc` sources every item and holds bar-wide defaults

## Anti-Patterns

- Don't put data-fetching logic in `items/` — that belongs in `plugins/`
- Don't hardcode colors in plugins — define in `sketchybarrc` defaults

## Notes

- Reload config: `sketchybar --reload`
- Config dir: `~/.config/sketchybar/` (set up by `install.sh`)
