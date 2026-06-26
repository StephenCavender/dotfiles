# Inspiration

People and posts that shaped how I work with AI. Not a link dump — notes on what I took from each.

## People

### Harper Reed

Micro-waterfall practitioner. His "15-minute cycles" framing clicked — define, execute, verify in tight loops instead of one massive prompt. Also convinced me that running agents unattended is a forcing function for better guardrails.

- [Waterfall in 15 minutes](https://harper.blog/2025/04/10/waterfall-in-15-minutes-or-your-money-back/)
- [My LLM codegen workflow](https://harper.blog/2025/02/16/my-llm-codegen-workflow-atm/)
- [Basic Claude Code](https://harper.blog/2025/05/08/basic-claude-code/)
- [Email, productivity, MCP agents](https://harper.blog/2025/12/03/claude-code-email-productivity-mcp-agents/)
- [An LLM codegen hero's journey](https://harper.blog/2025/04/17/an-llm-codegen-heros-journey/)
- [Auto-generate git commit messages](https://harper.blog/2024/03/11/use-an-llm-to-automagically-generate-meaningful-git-commit-messages/)
- [AI agents & social media](https://harper.blog/2025/09/30/ai-agents-social-media-performance-lambo-doomscrolling/)
- [Claude Code on your phone](https://harper.blog/2026/01/05/claude-code-is-better-on-your-phone/)

### Lee Robinson

Practical, product-focused AI usage. His "personal software" framing — using AI to build tools just for yourself — resonates. Stack page is a good model for documenting your AI setup publicly.

- [Stack](https://leerob.com/stack)
- [Agents](https://leerob.com/agents)
- [Pixo](https://leerob.com/pixo)
- [AI](https://leerob.com/ai)
- [Personal software](https://leerob.com/personal-software)

### Peter Steinberger (steipete)

"Just talk to it" — treating the agent as a colleague, not a tool. His agent-scripts repo is a good reference for reusable automation. Shipping at inference speed mindset.

- [Just talk to it](https://steipete.me/posts/just-talk-to-it)
- [Shipping at inference speed](https://steipete.me/posts/2025/shipping-at-inference-speed)
- [agent-scripts](https://github.com/steipete/agent-scripts)
- [CLAUDE.md gist](https://gist.github.com/steipete/d3b9db3fa8eb1d1a692b7656217d8655)

### Jamon Holmgren

Practical "8 best ways" framing. Good at distilling what actually moves the needle vs what's cargo cult.

- [The eight best ways I've improved my AI agent's code](https://jamon.dev/8ways)

### Addy Osmani

Naming the risks clearly. "Comprehension debt" — the gap between code volume and human understanding — is the best framing I've seen for why you can't just let agents ship unchecked. "Loop engineering" — designing the system that prompts the agent, not prompting it yourself — is where this is all heading.

- [Comprehension debt](https://addyosmani.com/blog/comprehension-debt/)
- [Loop engineering](https://addyosmani.com/blog/loop-engineering/)

### Mario Zechner

Minimalist agent philosophy. Built Pi (the coding agent I use) on four tools and a sub-1000-token system prompt. His "what if you don't need MCP" post validated my instinct that simple CLI tools beat elaborate protocol layers. Unix philosophy applied to agents.

- [What I learned building Pi](https://mariozechner.at/posts/2025-11-30-pi-coding-agent/)
- [What if you don't need MCP?](https://mariozechner.at/posts/2025-11-02-what-if-you-dont-need-mcp/)

### Lars Faye

The counterweight. "Agentic coding is a trap" — the supervision paradox (you need the skills agents are atrophying to supervise them). Reinforces why I still hand-write code regularly and never generate more than I can review in a session.

- [Agentic coding is a trap](https://larsfaye.com/articles/agentic-coding-is-a-trap)

### byme8

Counter-take: you don't always need elaborate CLAUDE.md files. Good reminder that over-engineering agent instructions is its own failure mode.

- [You don't need a CLAUDE.md](https://dev.to/byme8/you-dont-need-a-claudemd-jgf)

## Resources

Reference material — not philosophy, just useful.

- [Anthropic Claude Cookbooks](https://github.com/anthropics/claude-cookbooks) — Official patterns and examples for Claude integrations

## Ideas to Explore

- Cross-review patterns (one model reviews another's work)
- Unattended agent runs as a test of your guardrails
- "Personal software" as a category — tools built for an audience of one
- Comprehension debt mitigation strategies — "explain it back" checks, AI blackouts
- Loop engineering — what does my own autonomous loop look like?
