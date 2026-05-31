---
theme: default
title: Three years of coding with AI
info: Three years of coding with AI — and how I actually work
class: text-center
highlighter: shiki
transition: slide-left
mdc: true
---

# Three years of coding with AI

<p class="subtitle">The hype, the walls, and how I actually work</p>

<!--
- Opener — this is MY experience, not a Claude Code tutorial
- 3 years in the trenches; I've tried basically everything
- Set expectation: the wins AND the walls, honestly
-->

---

# From autocomplete to agents

<p class="subtitle">The road that got us here</p>

- **Autocomplete era** — Copilot in VS Code, then Cursor
- **Agentic era** — Cline, Roo, Aider (the first CLI agent), then Claude Code, opencode…
- **The models** — from Sonnet 3.0; plus GLM, MiniMax, Kimi, DeepSeek…

<!--
- I've used each of these firsthand — so when I say something changed, it's not hype
- Autocomplete: Copilot → Cursor (useful, but just fancy completion)
- Then agentic coding arrived: Cline, RooCode, Aider (first real CLI agent), then Claude Code, then OSS like opencode
- Tried most mainstream models since Sonnet 3.0 — plus a lot of Chinese ones (GLM, MiniMax, Kimi, DeepSeek)
- Keep it matter-of-fact, not a flex — the evolution is the point
-->

---
layout: center
class: text-center
---

# Then, last November, it clicked

<p class="subtitle">Opus 4.5 — Nov 24, 2025</p>

<!--
- For years: useful, not transformative
- Opus 4.5 (Nov 24, 2025) was the turning point — first model where the agentic workflow really held together
- THAT's when the "floor" got this high → leads into the next slide
-->

---

# I pasted this and walked away

<p class="subtitle">300 lines. Done. Correct.</p>

<div class="flex justify-center mt-3">
<img src="/easy-ticket.png" class="rounded-lg shadow-2xl max-h-[54vh] bg-white p-3" />
</div>

<!--
- A REAL Azure DevOps ticket — and note it's even a bit vague ("confirm with DKO", "define with PO", a Figma link)
- I copy-pasted it into Claude and didn't touch it
- Walked away → came back to a finished, correct ~300-line feature
- This is the FLOOR now: zero-effort tasks just work — even slightly underspecified ones
- Don't dwell — it's the hook, sets the "why you should care" energy
-->

---
layout: center
class: text-center
---

# Then it fought me for two days

<p class="subtitle">A library upgrade I finally fixed by hand</p>

<!--
- Major version bump, tons of breaking changes
- Claude struggled for 2 days → I took over and fixed it manually
- This is the CEILING: it still hits walls
- Honest counterweight to the floor — kills the hype allergy, builds trust
- THE FRAME: everything I do lives between these two. The skill is knowing where you are.
-->

---

# Where I actually live

<p class="subtitle">The messy middle — where most real work is</p>

- **Error-handling refactor** — its idea worked, but I saw the maintenance trap → I steered it
- **Typed side-sheets** — I had no idea how; it found a way I didn't know → it taught me

<!--
- Floor & ceiling are the rare extremes; 99% of work is here
- Error refactor: clever idea, but would've patched Redux internals = maintenance trap. I caught it, gave rough direction, it executed perfectly → I bring the judgment it doesn't weigh
- Side-sheets: I didn't know how; iterating, it used Redux tools I didn't know existed → it expands my solution space, teaches me
- Two directions: sometimes I steer it, sometimes it teaches me
-->

---
layout: center
class: text-center
---

# Rely on it — but steer

<p class="subtitle">Mostly you'll iterate, or come with a direction</p>

<!--
- The key finding: sometimes you can just rely on it
- But mostly you iterate — or bring a direction
- That's the whole game, between floor and ceiling
- → "So here's how I actually work in that zone" → into the workflow
-->

---
layout: center
class: text-center
---

# How I actually work

<p class="subtitle">The part that's still my job</p>

<!--
- Floor / ceiling / messy middle — you've just seen them
- Real Q: how do I work in that middle zone, reliably?
- Punchline up front: almost none of this is AI — it's engineering
- I just finally have the time to do it right
-->

---
layout: center
class: text-center
---

# First, a confession

<p class="subtitle">I'm not perfect</p>

<p class="muted mt-2">I know — take a moment.</p>

<!--
- Joke / self-derision: "I know everyone here thinks I'm the AI guy who never misses…"
- "...turns out, I'm not perfect. I make mistakes too."
- Beat — let them laugh
- Disarms the room → earns trust before the real story
- "And I've got a good one for you" → leads into the 10k-line PR
-->

---
layout: center
class: text-center
---

# I once shipped a 10,000-line PR

<p class="subtitle">Unreviewable.</p>

<!--
- Personal project, kept saying "keep going"
- Ended: one PR, 10,000 lines → unreviewable, even by me
- Threw it away → restarted bottom-up
- Small PRs: 700–1,500 lines → easy to review & trust
- Honest: my fault — bad planning, lazy reviewing
- Tool just made bad habits 10k lines big, fast
-->

---
layout: center
class: text-center
---

# Generation is cheap now

<p class="subtitle">Planning and review are the work</p>

<!--
- Old bottleneck: typing the code → gone
- New bottleneck: planning (what/how) + reviewability (human-verifiable chunks)
- Whole workflow is built to protect those two
-->

---

# I draw before I prompt

<p class="subtitle">Excalidraw, before I open Claude</p>

<div class="grid grid-cols-[1.25fr_1fr] gap-12 items-center mt-2">
<div class="pr-2 [&_li]:text-pretty">

- I think on a whiteboard first — the boxes, the arrows, the shape of it
- Drawing forces the decisions *before* any prompt exists

</div>
<div>

<img src="/excalidraw-schema.png" class="rounded-lg shadow-2xl w-full max-h-[60vh] object-contain bg-white/95 p-2" />

</div>
</div>

<!--
- Most people open the chat and type — I don't
- Know the codebase cold (built from scratch)
- Draw it first in Excalidraw — boxes & arrows
- Thinking is done before any prompt exists
-->

---

# Then I brainstorm the design

<p class="subtitle">/brainstorm — my prompt, plus the schema</p>

- I write a real prompt **and** bring the schema — not just a drawing
- Every unknown, I dig until I understand it
- **I don't stop until the plan is exactly what I want**

<!--
- I write an actual prompt (the intent, constraints, context) AND attach the schema screenshot
- The drawing is one input — the prompt does the heavy lifting
- /brainstorm, then iterate the design plan together
- Don't understand it? ask. Don't like it? change it
- MOST of my effort goes here — design plan = most important artifact
- Right plan → code writes itself; wrong plan → 10k-line PR
- WHY it matters: always aim to ONE-SHOT the scope you created. If the implementation doesn't work, you have to fix it; if it's really off, that fixing balloons.
- And the cost: lots of back-and-forth re-editing code everywhere burns time AND tokens. A good plan is the cheapest insurance against that.
-->

---

# The plan is HTML, not Markdown

<p class="subtitle">A tiny change that made a big difference</p>

<div class="grid grid-cols-[1.2fr_1fr] gap-10 items-center mt-2">
<div>

- Markdown plans were painful to read — especially code blocks
- I asked it to write the plan as an **HTML file** instead
- Way more readable. Steal this one.

</div>
<div>

<img src="/html-plan.png" class="rounded-lg shadow-2xl max-h-[58vh] mx-auto" />

</div>
</div>

<!--
- Used Markdown for plans for ages — hard to read (esp. code blocks)
- Now: ask for the plan as an HTML file, open in browser
- You need to fully OWN the plan — anything that makes it easier to read, do it. Ask Claude to format the data however YOU read it best. All the possible drifts start here: something underdefined, something left too open.
- Night and day. Costs nothing. Steal it.
-->

---

# Then it executes — task by task

<p class="subtitle">Clear the context, hand off the plan</p>

- The plan splits into tasks — mostly sequential, sometimes parallel
- I **clear the context**, then a subagent works through them one by one

<!--
- Design locked → ask for the implementation plan
- Splits into tasks (mostly sequential, some parallel)
- Clear the context — fresh start, no clutter
- Subagent dev skill works the tasks one by one
- Thinking's done; this part is just execution
- TEASE: "this runs on a thing called Superpowers — I'll come back to what it is in a few minutes"
-->

---

# Milestones, then a full review

<p class="subtitle">I stay in the loop</p>

- Big task? **Stop at each milestone** — I review, we fix, it continues
- At the end: a full review (with a tool I built — more on that later)

<!--
- Big/complex → don't let it run blind
- Stop at milestones: review → fix → continue
- End: full review with my own diff tool (show later)
- Rule: never merge what I haven't read
-->

---

# Staying in control

<p class="subtitle">A few commands I reach for constantly</p>

<div class="mt-6 text-xl leading-loose">

- `/rewind` — roll the conversation **and the code** back to an earlier point
- `/fork` — branch off to try something risky, keep the original safe
- `/continue` — jump back into a previous session
- `/btw` — ask a quick side question without polluting the context

</div>

<!--
- My day-to-day driving controls — recover & steer
- /rewind: when it goes sideways, undo to a checkpoint — code too, not just chat (aliases /undo, /checkpoint)
- /fork: explore a risky idea on a branch; original stays safe, return with /resume
- /continue: resume an earlier conversation (by name or picker)
- /btw: quick aside that doesn't bloat the main thread's context
- Stealable — like the HTML-plan tip
-->

---

# App or CLI?

<p class="subtitle">Two front doors, same Claude</p>

- **The app** — the easy on-ramp; click and go
- **The CLI** — what I use; it drops straight into my workflow
- Same Claude underneath — start with the app, grow into the CLI

<!--
- Why everything here is in a terminal — I work in the CLI
- App: lowest-friction way to start, great to try it
- CLI: lives in my real workflow — terminal, git, scripts, tmux → what I actually use
- Same engine; the app is the on-ramp, the CLI is where you end up
- → sets up worktrees next (a terminal/CLI way to run features in parallel)
-->

---

# Several features at once?

<p class="subtitle">A worktree each</p>

<div class="grid grid-cols-[1fr_1.5fr] gap-10 items-center mt-2">
<div class="[&_li]:text-pretty">

- A git **worktree** per feature — isolated, no collisions
- Run multiple agents in parallel, safely
- I use **Muxy** (also tried Cmux, Superset.sh)

</div>
<div>

<img src="/muxy-screenshoot.png" class="rounded-lg shadow-2xl w-full border border-white/10" />

</div>
</div>

<!--
- This is HOW you do the "sometimes parallel" part
- Each feature gets its own git worktree → separate working dir, agents don't step on each other
- Lets me run several Claude sessions at once without chaos
- Tools: Muxy (my pick), Cmux, Superset.sh — each maps a feature → a worktree
- Callback: Superpowers does this automatically (worktree step in its pipeline)
-->

---
layout: center
class: text-center
---

# Make the feedback loop fast

<p class="subtitle">It's the agent's senses</p>

<div class="mt-8 text-2xl leading-relaxed">

ESLint → **oxlint** · 15s → **600ms**

Prettier → **oxfmt** · 4s → **400ms**

Typecheck → **tsgo** <span class="muted text-xl">(beta)</span> · 15s → **2s**

Test suite <span class="muted text-xl">(2,400 tests)</span> · 70–80s → **16s**

</div>

<p class="muted mt-10">We basically recreated CI — just fast, and local.</p>

<!--
- Agent only knows success via signal: tests / types / lint
- Slow loop = blind, slow agent (80s tests → 80s per correction)
- Sharpened its senses: oxlint, oxfmt, tsgo (15s→2s), 2,400 tests in 16s
- Joke: AI forced us to recreate CI — fast & local, every few seconds
- Kicker: tolerated slow tooling for years; the agent made us fix it — humans benefit too
-->

---
layout: center
class: text-center
---

# Most of that wasn't AI

<p class="subtitle">It was just engineering</p>

<!--
- Drawing, requirements, planning, review = not AI
- It's just engineering — the part that separates good engineers
- What changed: no more typing code by hand → time to do it right
- Honestly: it made me a better engineer
-->

---
layout: center
class: text-center
title: The 80 / 20
---

<div class="max-w-4xl mx-auto text-3xl leading-snug italic opacity-95">
"80% of my skills are worthless now. But the other 20% are worth <strong>way</strong> more than before — and I get to focus on getting better at them."
</div>

<!--
- 80% gone = generation / syntax / boilerplate / wiring
- 20% left = judgment / planning / architecture / review — worth more now
- Worried this makes you obsolete? It's the opposite
- The valuable part of you got more valuable — and you have time to sharpen it
-->

---
layout: center
class: text-center
---

# Remember "Superpowers"?

<p class="subtitle">That whole workflow — it isn't mine</p>

<div class="mt-6 text-xl muted max-w-3xl mx-auto leading-relaxed">
An open-source skill collection for Claude Code that packages a full development methodology. Install once — and the agent works this way by default.
</div>

<!--
- Payoff of the tease from the execute slide
- "Everything I just showed you — brainstorm, plan, subagents — comes from here"
- Open-source, by Jesse Vincent (obra) + Prime Radiant
- Install: /plugin install superpowers@claude-plugins-official
- i started to built the same stuff, trying to enforce TDD, the plan, the subagents etc but it was quite hard during that time and ended using this one 
- Honest: I didn't invent the discipline — I adopted it. So can you.
-->

---

# What it actually does

<p class="subtitle">Best-practice engineering, encoded as skills</p>

<div class="flex items-center justify-center gap-3 mt-14 flex-wrap text-lg">
  <div class="px-4 py-3 rounded-lg bg-white/5 border border-white/10">Brainstorm</div>
  <span class="opacity-40">→</span>
  <div class="px-4 py-3 rounded-lg bg-white/5 border border-white/10">Plan</div>
  <span class="opacity-40">→</span>
  <div class="px-4 py-3 rounded-lg bg-white/5 border border-white/10">Subagents</div>
  <span class="opacity-40">→</span>
  <div class="px-4 py-3 rounded-lg bg-white/5 border border-white/10">TDD</div>
  <span class="opacity-40">→</span>
  <div class="px-4 py-3 rounded-lg bg-white/5 border border-white/10">Review</div>
</div>

<p class="muted mt-14 text-center">The discipline from the last section — automated and enforced.</p>

<!--
- Brainstorm: refine the idea with questions before any code
- Plan: break into 2–5 min tasks — exact files + verification steps
- Subagents: fresh agent per task, two-stage review (spec, then quality)
- TDD: red → green → refactor (it deletes code written before the test)
- Review + finish: review against the plan, then merge/PR
- Point: this IS my Section 3 workflow — I just don't do it by hand
-->

---

# Why subagents?

<p class="subtitle">Context is the bottleneck on long features</p>

- One long conversation **rots** — it fills with noise, the thread gets lost, quality drops
- So each task runs in a **fresh subagent** — clean context, only what it needs
- Every task gets a **two-stage review**: did it match the spec? is the code good?

<!--
- The real problem on big features: context degradation
- A single window fills with old detail, dead ends, noise → the model loses the plot
- Fix: a fresh agent per task, clean slate, only the relevant context
- Main thread stays clean; the work comes back done
- Two-stage review per task: (1) spec compliance, (2) code quality
- THIS is why the long-feature workflow actually holds together
-->

---

# TDD — but there's a catch

<p class="subtitle">Red → green → refactor, enforced</p>

- It writes the test first, watches it fail, then writes the code
- **No cheating** — code written before its test gets deleted, no exceptions
- The catch: **it's only as good as the tests you specified in the plan**

<!--
- Superpowers enforces real TDD: red → green → refactor
- Deletes code written before the test → no cheating
- BUT garbage in, garbage out: vague test spec → shallow tests
- So the test spec is part of PLANNING — loops back to "planning is the work"
- Where I spend effort: exactly what to test, the cases, the edges
-->

---

# Review catches the basics

<p class="subtitle">So my time goes to what matters</p>

- An automated pass reviews the work **against the plan**, flags issues by severity
- It catches the small stuff **before I ever look**
- I spend my review on the judgment calls — not the typos

<!--
- Superpowers reviews against the plan, flags by severity
- Catches basic mistakes before I dive in → no wasted time on trivia
- Frees my human review for what needs judgment
- (Different from LGTM, my own review tool — that's next section)
-->

---
layout: center
class: text-center
---

# I wasn't totally honest

<p class="subtitle">"A good plan, and Claude does it right" — almost</p>

<!--
- Callback to Section 3
- A plan tells Claude WHAT to build — not how WE build
- Left alone, it invents its own patterns
- So how do we enforce OURS? That's this whole section.
-->

---

# Three ways to enforce your patterns

<p class="subtitle">From soft to hard</p>

<div class="grid grid-cols-3 gap-6 mt-12 text-center">
  <div class="px-5 py-6 rounded-lg bg-white/5 border border-white/10">
    <div class="text-2xl font-bold">CLAUDE.md</div>
    <div class="muted mt-2 text-base">always-on rules</div>
  </div>
  <div class="px-5 py-6 rounded-lg bg-white/5 border border-white/10">
    <div class="text-2xl font-bold">Skills</div>
    <div class="muted mt-2 text-base">know-how, on demand</div>
  </div>
  <div class="px-5 py-6 rounded-lg bg-white/5 border border-white/10">
    <div class="text-2xl font-bold">Hooks</div>
    <div class="muted mt-2 text-base">code that blocks</div>
  </div>
</div>

<p class="muted mt-10 text-center">soft → hard</p>

<!--
- Soft → hard spectrum
- CLAUDE.md: always in context (rules)
- Skills: loaded on demand (procedures / know-how)
- Hooks: enforced by code — can't be ignored
- We'll walk each
-->

---

# CLAUDE.md

<p class="subtitle">The always-on rules</p>

- A markdown file at the project root, **loaded into every session**
- Conventions, do's and don'ts, the hard "never touch X"
- The cheapest way to steer Claude — start here

<!--
- Always in context → use it for rules that ALWAYS apply
- Our stack, our conventions, hard "never do this"
- Cheap, immediate, first thing to set up on a project
- But it's always-on → keep it lean. Everything else = skills.
-->

---

# Rules files

<p class="subtitle">Modular CLAUDE.md — that scales</p>

- Split rules into `.claude/rules/` — loaded automatically
- **Path-scope** them: frontend rules load only on frontend files
- Always-on guidance, without bloating context

<!--
- Honest: I haven't leaned on this yet — but it's worth knowing
- .claude/rules/ is a first-class feature: a modular CLAUDE.md
- The good bit: path-scoped rules (paths: frontmatter) load on-demand, only for matching files → context-efficient
- It's the answer to "keep CLAUDE.md lean": split + scope instead of one big file
- On my list to adopt
-->

---
layout: center
class: text-center
---

# Then there's skills

<p class="subtitle">Rules are always-on — skills load only when they fit</p>

<!--
- Transition: CLAUDE.md + rules = the always-on layer; skills = the on-demand layer
- And here's the thing — Superpowers was just a curated set of skills, nothing magic
- A skill = a markdown file teaching Claude how to do something
- So you're not stuck with theirs — write skills for YOUR team
- "And you can write your own" → this is where it gets fun
-->

---

# What's in a skill?

<p class="subtitle">A markdown file — that's it</p>

<div class="grid grid-cols-[1fr_1fr] gap-10 items-center mt-2">
<div class="[&_li]:text-pretty">

- **name** — what it's called
- **description** — *when* to use it ← the agent matches on this
- **instructions** — how your team does the thing

</div>
<div>

<div class="text-sm">

```yaml
name: side-panel-animation
description: Use when animating
  a side panel
---
# How we animate side panels
1. ...
```

</div>

</div>
</div>

<!--
- Demystify: it's just markdown + a little frontmatter
- The DESCRIPTION is the key line — it's what the agent reads to decide to load it
- No syntax lesson — just show it's approachable
-->

---

# Two ways a skill fires

<p class="subtitle">The agent reaches for most of them on its own</p>

- **Automatic** — it reads the description and loads the skill when the task matches
- **Manual** — you invoke it yourself, when *you* decide

<!--
- Auto: only names + descriptions sit in context; the body loads on demand (progressive disclosure)
- A good description = the skill fires at the right moment, hands-free
- Manual: some skills you trigger deliberately (like my review tool)
- Sets up the showcase: our codebase skills = auto; LGTM = manual
-->

---

# Skills we wrote for our codebase

<p class="subtitle">Tribal knowledge — written once, enforced automatically</p>

- **Run the frontend with no backend** — agree a contract, mock the API (MSW)
- **Test-data factories** — consistent fixtures, maintained in one place
- **Assertable mocks** — pass data into the mock so tests can check it
- **Side-panel animations** — our specific orchestration
- **Testing conventions** — everything we enforce in tests

<!--
- These all fire AUTOMATICALLY when the agent hits that kind of work
- The lesson: skills capture YOUR patterns — what a new hire learns by osmosis
- Now the AI follows them without being told, every time
- Frame by PROBLEM SOLVED, not code (room doesn't read TS)
- Dev-MSW (#1) mocks so you can run the front alone; assertable-MSW (#3) is for tests
-->

---

# Write skills like good docs

<p class="subtitle">Progressive disclosure</p>

- Keep the entry **lean** — just the essentials
- Link out to detail; it loads **only when needed**
- Don't drown the agent — same reason context discipline matters

<!--
- Our testing skill got big → we're adding progressive disclosure
- Lean entry, deeper docs loaded on demand
- Keeps the skill cheap to load and easy to maintain
- Same principle as everything else: protect the context
-->

---

# LGTM — so I built my own

<p class="subtitle">Invoked by hand: <code>/lgtm-review</code></p>

<div class="flex justify-center mt-3">
<img src="/lgtm-review-2.png" class="rounded-lg shadow-2xl max-h-[64vh] border border-white/10" />
</div>

<!--
- The climax of "make it yours" — I had a friction, I built a skill for it
- Reviewing Claude's diffs was my biggest friction
- So I built a GitHub-like diff + line-comments view
- /lgtm-review opens it; I comment on lines; Claude reads them back and fixes
- Cut my review friction massively
- The MANUAL example (vs. the auto codebase skills)
- Point: you're not a consumer of these tools — you extend them
-->

---

# Hooks

<p class="subtitle">Hard enforcement — code that runs</p>

- Scripts that fire on events: before a tool runs, after an edit…
- They can **block** an action, not just suggest
- Example: auto-format every file the moment it's saved
- Where "never do X" becomes guaranteed, not hopeful

<!--
- CLAUDE.md and skills GUIDE; hooks ENFORCE
- Run on events: pre-tool-use, post-edit, on-stop, etc.
- Generic example: a post-edit hook that runs the formatter on every changed file → never an unformatted commit
- Can also hard-block a risky command before it runs
- The hard end of the soft → hard spectrum
-->

---
layout: center
class: text-center
---

# Let's talk about security

<p class="subtitle">Not my domain — so let's actually talk</p>

<!--
- BE HONEST: this is not my area of expertise
- I've played with the solutions — poked at Claude Code's sandbox, tried tools, built one around our stack
- I'm not here to prescribe — this is the part where we discuss as a team
- Engineers respect "I don't have this figured out" — say it plainly
-->

---

# The real risk isn't only the AI

<p class="subtitle">It's the code we already run</p>

- **Shai-Hulud** — self-replicating npm worm, 500+ packages, steals your tokens
- **TanStack** — weeks ago, 42 packages hijacked the same way
- Both fire on `npm install` — no AI involved

<!--
- Supply-chain attacks are the real, current threat — and they predate AI
- Shai-Hulud (Sept 2025): worm across npm, harvests AWS/GitHub/SSH creds via post-install scripts, self-replicates
- TanStack (May 11, 2026 — just weeks ago): 84 malicious versions, 42 @tanstack packages, same worm family (Mini Shai-Hulud)
- Point: we ALREADY run untrusted code constantly — every npm install. The AI just adds one more actor running code with our credentials.
- Reframe: AI raises the stakes, it didn't create the risk
-->

---

# So I poked at sandboxing

<p class="subtitle">Contain what the agent can touch</p>

- Claude Code has a **sandbox** — I poked at its edges (don't treat it as airtight)
- **Bromure** — runs the agent in a throwaway VM, swaps fake creds for real *on the wire*
- Promising — but I hit multiple install bugs

<!--
- The idea: limit what the agent (and the code it runs) can reach — files, network, secrets
- Claude Code's built-in sandbox is decent, but I found ways around it → not a hard wall
- Bromure (open source): disposable Linux VM + host proxy that substitutes real credentials at the wire, so secrets never enter the VM — clever
- But: multiple installation bugs when I tried it
-->

---

# I even built one — "camisole"

<p class="subtitle">The project in an isolated OrbStack VM</p>

- Runs each project in an **isolated VM** (OrbStack isolated flags)
- Scripts to SSH into the right VM per folder, and attach Cursor / Zed over SSH
- Works nicely — but adds **a lot of friction**

<!--
- My experiment around tooling we already have (OrbStack)
- Each project folder → its own isolated VM; scripts to SSH in, and to attach Cursor/Zed over SSH
- It genuinely works and isolates well
- But the friction is real — every bit of isolation costs usability
- Honest: a fun experiment, not a recommendation
-->

---

# It's a trade-off — and we haven't solved it

<p class="subtitle">More isolation = more friction</p>

- No convention yet — it's a question of **acceptable residual risk**
- Most of it comes down to **good hygiene**
- So… what should we do? Let's talk.

<!--
- Honest landing: security vs usability, and we don't have a convention yet
- It's about acceptable residual risk — how much friction are we willing to take
- A lot is just hygiene: keep prod creds out of where the agent runs, scope tokens, don't npm install blindly
- Lots of people have suggestions — open the floor, this is a discussion
- Then → into the close
-->

---
layout: center
class: text-center
---

# These days

<p class="subtitle">All that workflow? I use less of it now</p>

<!--
- TRANSITION: we're done with security — zoom back out to the workflow itself, to close
- Honest turn — I showed you a heavy workflow; lately I reach for it less
- Models got smart enough: a good back-and-forth now ends in a plan, no machinery
- If the work is well-scoped, implementation often skips the subagent ceremony
- And the ceremony isn't free — more time, way more tokens, every single loop
- NOT a contradiction: §3–§5 is how you build the instinct, and still right for big / hard work
-->

---

# The framework was training wheels

<p class="subtitle">Coding with AI is a relationship</p>

- Frameworks matter most when you **start** — they teach the discipline
- Over time you know the agent like a colleague — its flaws, its strengths
- And you build around it

<!--
- Superpowers et al. are invaluable starting out — and still for big / hard tasks
- It's like working with the same colleague every day: you learn how it thinks, where it slips
- You stop needing the scaffolding and start working WITH it
- The discipline gets internalized — that was always the goal
-->

---

# What outlasts any framework

<p class="subtitle">If you take anything, take these</p>

- **Iterate** — the conversation *is* the work
- **Be concise** — ask for short answers; it eases everything
- **Ask when unsure** — you learn something, or you catch *its* misunderstanding
- **Write a skill** when it keeps missing the same thing
- **Manage your context** — start fresh when it drifts; don't fill it blindly
- **Review, review, review** — you own the code

<!--
- This is the takeaway slide — the thing to photograph
- Iterate: the back-and-forth is the skill; rewind when it drifts
- Concise: short answers keep the discussion (and the context) clean
- Ask: when you don't understand, ask — either you learn, or you surface a misunderstanding on ITS side
- Write a skill: when it keeps missing the same thing, encode it
- Context: the 1M window is nice but a NOOB TRAP — just because you can hold a lot doesn't mean you should. Start fresh to avoid drift / hallucination. But each restart costs a context re-creation → don't fill context blindly, especially during brainstorm.
- Review: you merge it, you maintain it, it's your name on it (at least for now)
-->

---

# Match the tool to the task

<p class="subtitle">Different agents, different effort</p>

- Not every task needs the biggest model or the deepest thinking
- Fast + cheap for the simple stuff; high-effort for the hard reasoning
- Pick deliberately — it saves time and tokens

<!--
- Use different agents / effort levels per task
- Small fast model for boilerplate; Opus / high-effort for gnarly reasoning
- Part of "working simpler and on purpose"
-->

---
layout: center
class: text-center
---

# In the end, you own it

<p class="subtitle">The tool changed. The responsibility didn't.</p>

<!--
- The final word: whatever the workflow, you merge it, you maintain it, it's your name on it
- The skills that matter are the ones that keep you in control
- Callback: planning and review are still the work
- Thanks → questions
-->

