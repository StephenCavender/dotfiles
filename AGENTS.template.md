# AGENTS.md

## Philosophy

- Write code a human can read, understand, and maintain without comments
- Clarity over cleverness — if it needs a comment, rewrite it
- Pure functions, immutability, composition over inheritance
- Only create abstractions when used in 3+ places
- Explicit over implicit. No magic. Name things what they are.
- Small functions, single responsibility. Declare intent through structure.

## Rules

- No `any` — use `unknown` or narrow types
- No `useEffect` unless truly unavoidable
- No helper functions that save fewer than 5 lines
- No inline comments explaining bad code — write better code
- Favor array methods (map, filter, reduce) over imperative loops
- Explicit return types on exported functions
- `interface` over `type` for object shapes
- Server Components by default — `'use client'` only when needed
- Tests live next to source: `*.test.ts`

## Stack

- TypeScript strict, Next.js App Router, React (functional + hooks)
- Tailwind v4 + shadcn/ui
- Convex for backend state, Zustand for minimal client state
- Vitest + React Testing Library
- ESLint + Prettier (let them handle formatting — don't repeat their rules here)

## Git

- Conventional Commits: `feat|fix|chore|refactor|docs|test|perf(scope): message`
- Branch: `feature/description`, `fix/description`
- Squash merge for feature branches

## Commands

```bash
npm run dev         # Dev server + Convex
npm run build       # Production build
npm run test        # Vitest
npm run lint        # ESLint + Prettier
npm run typecheck   # tsc --noEmit
```

## When stuck

- Read existing code for patterns before inventing new ones
- Check `docs/` if the folder exists
- Ask me if genuinely ambiguous — don't guess on architecture
