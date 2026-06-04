---
name: github-cli
description: Interact with GitHub (issues, pull requests, code search, releases, repo files, the REST/GraphQL API) using the official `gh` CLI instead of an MCP server. Use whenever a task involves reading or writing GitHub data — opening/reading issues and PRs, reviewing diffs, searching code across repos, checking CI status, or scripting against the GitHub API.
---

# GitHub via `gh`

Progressive-disclosure replacement for the GitHub MCP server. Models already know `gh`; this skill just maps common intents to commands so you pay zero per-session token tax until the moment you need it.

## Prerequisite

Auth is handled by `gh` itself (token in the OS keychain, never in config files):

```bash
gh auth status          # verify logged in
gh auth login           # one-time, if not
```

If `gh auth status` fails, stop and tell the user to run `gh auth login` — do not paste a PAT into any file.

## Issues

```bash
gh issue list --repo OWNER/REPO --state open --limit 30
gh issue list --repo OWNER/REPO --label bug --assignee @me
gh issue view 1234 --repo OWNER/REPO --comments
gh issue create --repo OWNER/REPO --title "T" --body "B" --label bug
gh issue comment 1234 --repo OWNER/REPO --body "..."
gh issue close 1234 --repo OWNER/REPO
```

## Pull requests

```bash
gh pr list --repo OWNER/REPO --state open
gh pr view 567 --repo OWNER/REPO --comments
gh pr diff 567 --repo OWNER/REPO            # full diff to stdout (pipe to a file for large PRs)
gh pr checks 567 --repo OWNER/REPO          # CI status
gh pr create --repo OWNER/REPO --base main --head my-branch --title "T" --body "B"
gh pr review 567 --repo OWNER/REPO --approve   # or --request-changes --body "..."
gh pr merge 567 --repo OWNER/REPO --squash
```

For the *current* checked-out branch's PR, omit the number: `gh pr view`, `gh pr checks`.

## Code & repo search

```bash
gh search code 'WithContext language:go org:myorg' --limit 30
gh search issues 'is:open label:bug repo:OWNER/REPO'
gh search prs 'author:@me is:merged'
gh search repos 'topic:cli language:rust --owner myorg'
```

## Reading repo files without cloning

```bash
gh api repos/OWNER/REPO/contents/path/to/file --jq '.content' | base64 -d
gh api repos/OWNER/REPO/commits/SHA            # commit details
gh release view --repo OWNER/REPO              # latest release
gh release list --repo OWNER/REPO
```

## Anything else → raw API

`gh api` speaks the full REST and GraphQL API. Composable with `jq`, pipeable, saveable to disk.

```bash
gh api /repos/OWNER/REPO/branches --jq '.[].name'
gh api graphql -f query='query { viewer { login } }'

# Paginate automatically:
gh api --paginate /repos/OWNER/REPO/issues --jq '.[].title'
```

## Why this over the MCP

- **Token-cheap**: this README loads on demand; the MCP dumped ~40 tool schemas into every session's context.
- **Composable**: pipe to `jq`, redirect to files, chain in one bash line — no round-trip through model context.
- **No secrets in config**: `gh` keeps the token in the keychain; no PAT in `opencode.json`/`.mcp.json`.
- **Portable**: works identically across opencode, pi, and caveman — it's just bash.

## Tips

- For large PR diffs, write to a file first: `gh pr diff 567 -R OWNER/REPO > /tmp/pr.diff`, then read the file. Avoids blowing context on a huge inline diff.
- `gh` respects the current repo when run inside a clone, so `--repo` is optional locally.
- Use `--json <fields> --jq <filter>` on list/view commands for structured, minimal output.
