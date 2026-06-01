---
name: lgtm-review
description: Read and act on review comments stored in the lgtm review store. Use when the user asks "/lgtm-review", "address my lgtm comments", "apply the review", or similar.
---

# lgtm Review

> Reviews are now keyed by `(baseRef, headRef)` (or `commit:<sha>`). Comments stay on
> the review across views: working-tree, cumulative diff, and per-commit diff all
> address the same Review. You don't need a running `lgtm` browser to run these
> commands — the CLI writes directly to ~/.config/lgtm/reviews/.

`lgtm` is a local diff reviewer. The user leaves review comments anchored to specific
files and lines. This skill teaches you to read those comments, apply requested
changes, answer questions, and mark each comment resolved so the user can see what
you did.

The browser is for the user — do **not** run `lgtm` to launch a server yourself.
Use the `lgtm session ...` CLI; it writes directly to the review store on disk.

## Workflow

Threads in lgtm are one-level deep (GitHub-style): a top-level comment plus zero or
more replies, all anchored at the same file/line. The server emits *grouped* threads —
you don't have to regroup by `parentId` yourself.

```text
1. lgtm session list                                    # confirm reviews exist for this repo
2. lgtm session review                                  # fetch the default-filtered "your turn" threads (always JSON)
3. for each returned thread:
     a. read the full thread (root.body + replies[*].body) for context
     b. if outdated is false, read currentlyAt.path at currentlyAt.startLine for the
        live code (skip or flag outdated threads — currentlyAt may be null)
     c. classify the latest comment's intent (request vs question)
     d. REQUEST  → make the code change → comment resolve <thread.root.id> --by agent
        QUESTION → comment reply <thread.root.id> --body "..." → optionally resolve
4. summarize what was done; never silently skip a thread
```

The default `session review` filter IS "your turn" — it drops resolved threads, outdated
threads, and threads whose latest message is from the agent. Pass `--include-resolved`,
`--include-outdated`, or `--include-handled` if you need the full picture.

When the user follows up on your reply (a third comment in the thread), treat the
whole conversation as context — don't respond just to the last message in isolation.

## Commands

### Inspect

```bash
lgtm session list
lgtm session review [--repo <path>] [--review-id <ULID>] [--base <ref>] \
  [--include-resolved] [--include-outdated] [--include-handled]
```

Both commands always emit JSON to stdout — there is no flag to toggle the format.

`session review` returns:

```json
{
  "repoPath": "/abs/path/to/repo",
  "review": {
    "id": "01J...",
    "key": "branch:main:feature/x",
    "baseRef": "main",
    "headRef": "feature/x",
    "label": "main..feature/x",
    "threads": [
      {
        "root": { "id": "01J...", "file": "src/auth.ts", "side": "new", "startLine": 42, "endLine": 42, "body": "Why is this not awaited?", "resolved": false, "author": "user", "commitSha": "abc…", "anchorContent": "…", "codeContext": "…" },
        "replies": [],
        "outdated": false,
        "latestAuthor": "user",
        "currentlyAt": { "path": "src/auth.ts", "side": "new", "startLine": 42, "endLine": 42 }
      }
    ]
  }
}
```

`side` is `"new"` for additions/post-change lines and `"old"` for deletions/pre-change lines.
`codeContext` is the diff snippet around the anchor — read it before opening the file
so you understand what the user is pointing at.
`currentlyAt` is the anchor reprojected onto HEAD; use it (not `root.startLine`) to
open the live file. `outdated: true` means the anchored line no longer exists at HEAD.

### Add a comment

```bash
lgtm session comment add \
  --file src/auth.ts --side new --new-line 42 \
  --body "Reasoning..." \
  --author agent
```

- `--file` and `--body` are required
- For `--side new`, pass `--new-line`. For `--side old`, pass `--old-line`. (Anchors must
  point at a line that exists in the cumulative diff — the CLI validates this.)
- `--author` defaults to `user`; pass `agent` when the comment is yours.
- Optional `--end-line N` for multi-line anchors.

### Reply to a comment

```bash
lgtm session comment reply <parent-comment-id> --body "Done — see new function in src/auth.ts:55"
```

- Anchor (file/side/lines) is inherited from the parent. Don't re-specify.
- `--author` defaults to `agent` for replies.

### Resolve / reopen

```bash
lgtm session comment resolve <comment-id> --by agent
lgtm session comment reopen  <comment-id>
```

- Always pass `--by agent` when resolving so the user can see at a glance which
  threads you handled vs. ones they closed themselves.
- Resolve **cascades to the entire thread** — passing the root id, a reply id, or
  any thread member resolves all of them with the same `resolvedAt`/`resolvedBy`.
  Prefer passing the root id for clarity.
- Reopen also cascades and clears `resolvedAt`/`resolvedBy` across the thread.

### Disambiguating reviews

The CLI infers the review from cwd: it resolves the repo's root SHA, finds reviews under
~/.config/lgtm/reviews/<root-sha>/, and picks one by:

  1. --review-id <ULID>      (always wins)
  2. --base <ref>            (looks for branch:<base>:<current-head>)
  3. upstream-tracking base  (git rev-parse --abbrev-ref @{upstream})
  4. most-recently-updated unarchived review whose headRef matches HEAD
  5. detached HEAD           → commit:<HEAD-sha> review

If multiple repos hit the same review (rare), pass `--review-id` to disambiguate.

## Classifying intent

A comment is a **request** when it tells you to change something:
*"rename this"*, *"extract a helper"*, *"this should be async"*, *"remove the cast"*.

A comment is a **question** when it asks for explanation or clarification:
*"why this approach?"*, *"is this safe under concurrency?"*, *"didn't we agree to use X?"*

When in doubt, treat it as a question first: post a reply explaining what the code
does and ask the user whether they want the change. It's cheaper than guessing wrong
and rewriting code the user didn't actually want changed.

## Typical flow

1. Run `lgtm session review`.
2. For each returned thread, if `outdated` is false read `currentlyAt.path` at
   `currentlyAt.startLine` for the live code (use `root.codeContext` as a hint, but
   open the file to see the surrounding context). Skip or flag outdated threads —
   `currentlyAt` may be null.
3. Apply changes for **requests**:
   - Make the edit.
   - Then `lgtm session comment resolve <thread.root.id> --by agent`.
4. Reply to **questions**:
   - `lgtm session comment reply <thread.root.id> --body "<answer>"`.
   - If your reply also satisfies the comment (e.g. you confirmed nothing needs to
     change), follow with `lgtm session comment resolve <thread.root.id> --by agent`.
   - If your reply asks the user something back, leave it unresolved.
5. End with a short summary: how many requests applied, how many questions answered,
   anything you intentionally left unresolved and why.

## Common errors

- **"No review for head &lt;ref&gt;. Pass --base &lt;ref&gt; or --review-id."** — the CLI
  couldn't pick a review for the current branch. Either the user hasn't opened a
  review on this branch yet, or there are multiple bases — pass `--base <ref>` or
  `--review-id <ULID>` to disambiguate.
- **"Anchor line not in cumulative diff"** — the file/side/line you used isn't part of
  the diff. Re-fetch with `session review` and pick a real anchor.
- **"No parent comment &lt;id&gt; in review &lt;reviewId&gt;"** — the parent ID is wrong or
  the comment was deleted. Re-fetch with `session review`.
- **"parentId must reference a top-level comment, not another reply"** — replies
  can't chain off replies; pass the thread root's id (`thread.root.id`).

## What NOT to do

- Do **not** run `lgtm` (the browser server) yourself; the user controls the browser UI.
- Do **not** modify review files under `~/.config/lgtm/reviews/` directly — go through
  the CLI so writes are schema-validated, atomic, and visible to any live UI via its
  file-watcher.
- Do **not** act on threads whose `latestAuthor` is `"agent"` — those are your prior
  replies, not work items. The default `session review` filter already excludes them.
- Do **not** silently delete comments. If a comment is wrong or irrelevant, reply
  explaining why and let the user resolve it.
