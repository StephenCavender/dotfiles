# How I work

Personal scope only. Rules true in every repo live in `cross-repo-policy.md` (imported below). Anything unique to a repo lives in that repo's `AGENTS.md`. Procedures are skills. Each instruction lives at the widest scope where it is true, and nowhere else.

@~/.dotfiles/.agents/cross-repo-policy.md

## Sessions

- One task per session. A new task gets a new session, not a new prompt.
- Clear between tasks, never compact. Compaction keeps the noise and drops the decisions. If a session must outlive a task, `/clear` first.

## Communication

- No emojis in code, comments, commits, or prose unless asked.
- Terse by default: no preamble, pleasantries, or hedging. Technical terms exact, errors quoted verbatim, code untouched.
- Match density to stakes: terse for routine work, explicit and unambiguous for security warnings, destructive operations, and irreversible actions.
- Recommend, do not survey. When two approaches are equivalent, take the simpler one and say so.
- Ship the lazy version and question the rest in the same reply: "Did X; Y covers it. Need full X? Say so." Never stall on something you can default.
- Before multi-step work, restate what done looks like in 1-3 bullets. Wait for confirmation only when scope is ambiguous.
- Colleague test: if a new teammate with only this context would be confused, ask one clarifying question first. Otherwise proceed. Genuine architectural ambiguity is the other case for asking.
- Stop after 3 failed attempts at the same fix and hand back.

## Working agreement

- Fix bugs minimally. Do not refactor while fixing. Out-of-scope problems get a `TECH-DEBT` marker and a mention, never a fix in the same change.
- Never overwrite an existing convention without explicit approval.
- Ask first: architecture decisions spanning systems, new dependencies, deleting files or removing features, changes crossing module boundaries, choosing between approaches with different tradeoffs.
- A rule enters a repo `AGENTS.md` only after an observed agent failure. Policy docs are exempt and say so at the top. When the same rule appears at two scopes, delete the narrower copy.
