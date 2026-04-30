# AGENTS.md — Project Guide

**Stack**: TypeScript · React · Next.js · Convex
**Branch**: main | **Commit**: <git-hash>

## OVERVIEW

<Brief description of the project>

## STRUCTURE

```
<project-root>/
├── app/             # Next.js App Router: routes, layouts, pages
├── components/      # Reusable React components (functional + hooks)
├── convex/          # Convex backend: schema.ts, functions/, auth/
├── lib/             # Utility functions, helpers, shared logic
├── hooks/           # Custom React hooks
├── store/           # Zustand state stores
├── types/           # TypeScript type definitions
├── public/          # Static assets
└── <additional-dirs>
```

## DEVELOPMENT FLOW

```bash
npm run dev          # Start Next.js dev server + Convex dev
npm run build        # Production build
npm run test         # Run Vitest tests
npm run lint         # ESLint + Prettier check
npm run typecheck    # TypeScript type checking
```

## WHERE TO LOOK

| Task | Location |
|------|----------|
| Add a page/route | `app/` (App Router) |
| Add a component | `components/` |
| Add Convex function | `convex/functions/` |
| Add Convex schema | `convex/schema.ts` |
| Add state store | `store/` (Zustand) |
| Add custom hook | `hooks/` |
| Add types | `types/` |
| Add utility/helper | `lib/` |
| Add env vars | `.env.local` (never commit) |

## CODING CONVENTIONS

**General**
- Indentation: 2 spaces, no tabs
- Quotes: single quotes
- Semicolons: required
- Max line length: 100 characters

**Functional Programming**
- Prefer pure functions with no side effects
- Use immutability — avoid mutating objects/arrays directly
- Favor composition over inheritance
- Use declarative code over imperative when possible
- Leverage array methods (map, filter, reduce) over loops

**Code Clarity**
- Write code that is easily understood and maintained by human engineers
- Prioritize clarity over cleverness — avoid terse or obscure patterns
- Use descriptive variable and function names
- Keep functions small and focused on a single responsibility
- Prefer explicit logic over implicit behavior

**TypeScript**
- `strict: true` in tsconfig
- Explicit return types on exported functions
- Prefer `interface` over `type` for objects
- No `any` — use `unknown` or proper types

**React**
- Functional components + Hooks only (no class components)
- App Router by default (Next.js `app/` directory)
- Server Components: default; `'use client'` only when needed
- Props: define interfaces, destructure with defaults

**State Management**
- Start with Zustand for client state
- Introduce TanStack Query + Context when server state needs grow
- Convex reactivity for backend-pushed state

**Convex**
- Strict folder structure: `convex/` with `schema.ts`, `functions/`, `auth/`
- All functions in `functions/` with clear file organization
- Use Convex validators for args/returns
- Auth setup in `convex/auth/`

**Testing**
- Framework: Vitest
- Place tests next to source: `*.test.ts` or `*.spec.ts`
- React Testing Library for component tests

**Linting & Formatting**
- ESLint + Prettier
- Prettier handles formatting (quotes, semicolons, indentation)
- ESLint enforces code quality rules

## GIT CONVENTIONS

**Commit Messages** (Conventional Commits)
```
feat(auth): add login with Convex
fix(api): handle null user in profile query
chore(deps): upgrade next to 15.x
```

Types: `feat`, `fix`, `chore`, `docs`, `style`, `refactor`, `perf`, `test`

**Branch Naming**
- `feature/description` — new features
- `fix/description` — bug fixes
- `chore/description` — maintenance tasks
- `refactor/description` — code refactoring

**Workflow**
- Default branch: `main`
- Rebase before merge when possible
- Squash merge for feature branches

## ANTI-PATTERNS

- No `any` type in TypeScript
- Don't use class components in React
- Don't put secrets in committed files — use `.env.local`
- Don't mix Pages Router and App Router in same project
- Don't skip Convex schema validation on functions
- Don't commit `.next/`, `node_modules/`, `.env*.local`

## COMMANDS

```bash
npm run dev              # Start dev server
npm run build            # Production build
npm run test             # Run tests (Vitest)
npm run test:ui          # Vitest UI mode
npm run lint             # Check linting + formatting
npm run lint:fix         # Auto-fix lint/format issues
npx convex dev           # Start Convex backend
```

## NOTES

- Server Components are default in App Router — add `'use client'` explicitly when needed
- Convex handles real-time data — no manual polling or SWR needed
- Zustand stores should be minimal; prefer server state via Convex/TanStack Query
- Prettier config lives in `.prettierrc` — matches single quotes, semicolons, 2 spaces
