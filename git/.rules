# git/

## Critical Mechanics

- Private config (name, email) → `gitconfig.local.symlink` — never put real values in `gitconfig.symlink`
- Bootstrap auto-generates `.local` from `.local.symlink.example` if it doesn't exist
- SSH enforced over HTTPS for github/gitlab/bitbucket (url rewrites in `gitconfig.symlink`)
- GPG signing enabled — format `ssh`, key `~/.ssh/id_ed25519.pub`

## Anti-Patterns

- Don't put author name/email in `gitconfig.symlink` — use `gitconfig.local.symlink`
- Don't disable SSH enforcement (url rewrites)
