# LGTM — agent guide

Local-first diff reviewer. Bun-based **server** + Vite-based **client** in one repo. Don't follow the generic "always Bun, never Vite" template — the dual setup is intentional and described below.

## Layout

- `src/cli.ts` — Commander CLI entry (launches the server + browser).
- `src/server/**` — Hono app, git access (simple-git), review store, parse/export. Runtime: **Bun**.
- `src/client/**` — React 19 SPA rendered by Vite, hydrated from `dist/client/` in production builds. Runtime: **browser**.
- `src/shared/**` — Zod schemas + inferred types shared between client and server.
- `tests/server/**` — `bun test` integration tests that spin real temp git repos via `tests/helpers/create-test-repo.ts`.
- `tests/client/**` — `vitest` + jsdom component/store tests.

## Commands

- `bun install` — install dependencies.
- `bun src/cli.ts` — run the tool against the current git repo (working-tree diff).
- `bun src/cli.ts --dev` — boot the Hono server and proxy static assets to a `vite` process on port 5174 (hot reload).
- `bun run build` — `vite build` (client) + `bun build` (server) into `dist/`.
- `bun test tests/server` — server test suite (fast, uses real temp repos).
- `bunx vitest run` — client test suite (jsdom).
- `bun run test` — both suites.

## Tooling decisions (don't silently revert these)

- **Client builder = Vite** (not Bun.serve/HTML imports). The `@pierre/diffs` worker pool ships ESM workers Vite handles correctly; rewriting this to Bun-native HTML imports is out of scope and is known-broken with the Pierre worker format.
- **Client tests = Vitest** (not `bun test`). `@testing-library/react` + jsdom integration is stable on vitest.
- **Server tests = `bun test`**. Spawns real git processes via `simple-git` and shells out with `Bun.$`.
- **Server framework = Hono** on `Bun.serve`. No Express, no Fastify.
- **State = Zustand** with a single `useReviewStore` as source of truth for review/comments/viewedFiles.
- **Schemas = Zod** in `src/shared/schemas.ts`; types are `z.infer<...>` in `src/shared/types.ts`. Don't hand-roll response types.
- **IDs = ULID** via `ulid` package. Review + comment IDs match `/^[0-9A-HJKMNP-TV-Z]{26}$/`.

## Security posture

The server binds `127.0.0.1` only, but the browser's same-origin policy doesn't block cross-origin form posts. All state-mutating routes therefore go through the Origin/Content-Type middleware in `src/server/index.ts`. Don't register a new POST/PATCH/DELETE without threading it through that middleware.

Every `id`/`sha` path parameter is validated (ULID or 40-char SHA) at the route layer. Never pass user-supplied strings straight into `simple-git` or `path.join` without validation.

## Things to avoid

- Writing `Session*` — the type is `Review`. Reviews live at `~/.config/lgtm/reviews/<root-commit-sha>/`, keyed by the repo's root-commit SHA (see `getRootCommitSha` in `src/server/git.ts`). Never recreate `.lgtm/` inside a repo.
- Storing `Set`/`Map` in a persisted zustand slice — `JSON.stringify` drops them. Use `Record<string, boolean>`.
- Using `window.confirm` / `window.alert` — inaccessible and blocks the main thread. Use the Dialog primitives in `src/client/components/ui/dialog.tsx`.
- `c.req.json()` without a `try/catch` — malformed JSON leaks as a 500.
- Calling `.parse()` (vs `.safeParse()`) inside a request handler.
