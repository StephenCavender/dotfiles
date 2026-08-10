#!/bin/bash
#
# Supply-chain cooldown.
#
# Refuse to install package versions published less than 3 days ago. Malicious
# releases are typically detected and yanked within hours, so a cooldown filters
# most supply-chain incidents at the install layer — no daemon, no proxy, no
# extra dependency. This is native package-manager config, not a wrapper.
#
# Cooldown says nothing about what a package does once it lands. It is one
# control, not the whole story; postinstall hooks are still the payload vector.
#
#   npm   min-release-age        days      11.10+   ~/.npmrc
#   pnpm  minimumReleaseAge      minutes   10.16+   pnpm's own global config
#   bun   minimumReleaseAge      seconds   1.3+     ~/.bunfig.toml
#   pip   uploaded-prior-to      ISO 8601  26.1+    ~/.config/pip/pip.conf
#
# pnpm does NOT read its cooldown from ~/.npmrc, and npm warns on (and will
# eventually reject) unknown keys there — so pnpm is configured via `pnpm config
# set`, which resolves its own platform-specific path and merges rather than
# clobbering other global pnpm settings. pnpm 11 already defaults to 1440; this
# only raises it to match the other three.
#
# yarn classic (1.x) has no equivalent; npmMinimalAgeGate needs Berry 4.10+.
#
# Project-level config beats user-level in every one of these tools. A global
# cooldown is not a backstop for a repo that sets its own value.

set -e

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

NPMRC="$HOME/.npmrc"

# Appended to ~/.npmrc. That file is not symlinked into the repo because it also
# holds registry auth config and is mode 600; we append instead of owning it.
NPM_KEYS=(
  "min-release-age=3"   # days
)

# Minutes. Keep in sync with the 3-day value used everywhere else.
PNPM_MINIMUM_RELEASE_AGE=4320

# link <source> <dest>
#
# Symlink source to dest. Never clobbers a real file — an existing regular file
# is left alone with a warning, since these are formats this script cannot safely
# merge in shell.
link () {
  local src="$1" dest="$2"

  mkdir -p "$(dirname "$dest")"

  if [ -L "$dest" ]; then
    if [ "$(readlink "$dest")" = "$src" ]; then
      echo "  ok: $dest"
      return
    fi
    ln -sfn "$src" "$dest"
    echo "  relinked: $dest -> $src"
    return
  fi

  if [ -e "$dest" ]; then
    echo "  !! $dest exists and is not a symlink — leaving it alone." >&2
    echo "     Merge these settings by hand, then delete it to adopt the repo copy:" >&2
    sed 's/^/       /' "$src" >&2
    return
  fi

  ln -sfn "$src" "$dest"
  echo "  linked: $dest -> $src"
}

echo "› npm cooldown ($NPMRC)"

if [ ! -e "$NPMRC" ]; then
  install -m 600 /dev/null "$NPMRC"
  echo "  created: $NPMRC"
fi

for key in "${NPM_KEYS[@]}"; do
  name="${key%%=*}"

  # Match the key at line start only, so a comment or longer key does not
  # register as a hit. npmrc is flat key=value, so a bare append is safe.
  if grep -qE "^[[:space:]]*${name}[[:space:]]*=" "$NPMRC"; then
    echo "  ok: $name already set"
  else
    printf '%s\n' "$key" >> "$NPMRC"
    echo "  added: $key"
  fi
done

echo "› pnpm cooldown"

if ! command -v pnpm > /dev/null 2>&1; then
  echo "  skipped: pnpm not installed"
elif [ "$(pnpm config get minimumReleaseAge 2>/dev/null)" = "$PNPM_MINIMUM_RELEASE_AGE" ]; then
  echo "  ok: minimumReleaseAge already $PNPM_MINIMUM_RELEASE_AGE"
else
  pnpm config set minimumReleaseAge "$PNPM_MINIMUM_RELEASE_AGE" --location=global
  echo "  set: minimumReleaseAge=$PNPM_MINIMUM_RELEASE_AGE ($(pnpm config get globalconfig))"
fi

echo "› bun cooldown"
link "$SOURCE_DIR/bunfig.toml" "$HOME/.bunfig.toml"

echo "› pip cooldown"
link "$SOURCE_DIR/pip.conf" "$HOME/.config/pip/pip.conf"

echo "✅ Supply-chain cooldown configured (3 days)"
