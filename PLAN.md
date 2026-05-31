# Presentation — Structure & Decisions

> Reference doc for building the talk. Decisions agreed during planning.
> Talk length: **1h – 1h15**. Audience: **engineers** (some already use Claude Code).
> Company is Mac-heavy, builds 2 products (1 web — my team, 1 native macOS/Windows).

---

## The thesis (the one idea the room should leave with)

**Planning and review are the real work now. Generation is solved.**

Everything in the talk is supporting evidence for this. The deck is built to land this single idea.

---

## Meta-theme — "AI didn't make me a worse engineer; it made me a better one"

Co-thesis, nearly as important as the main one. Disarms the room's deepest fear ("AI makes you lazy / obsolete / a worse engineer") with lived experience from the person who uses it the most.

The point: most of my 9-step workflow is **classic engineering** — planning, understanding requirements, thinking about the existing/missing pieces before writing a line. AI removed the hand-writing of code, which **freed the time to do that thinking properly.** It made me a better engineer.

Sharper framing to use out loud:
- **"AI didn't replace my engineering — it deleted the part that was never engineering."** (typing syntax, boilerplate, wiring = always overhead).
- **Supporting quote (paraphrase):** *"80% of my skills are now worthless — but the remaining 20% are worth WAY more than before. And the good news is I get to focus on becoming better at those 20%."* The 80% = generation/syntax/overhead; the 20% = judgment, planning, architecture, review. Answers "am I becoming obsolete?" with: the valuable part of you just became more valuable.

**Placement:**
- **Payoff beat at the END of Section 3** — after walking the workflow, stop and reveal: "notice, most of that wasn't AI, it was just engineering — I just finally have time for it." Emotional high point of the body.
- **Echoed in the close (Section 6)** as the parting thought. Bookending makes it intentional.

---

## Audience & format decisions

- **Engineers, some already users.** Skip the basics (no "what is an LLM"). Surprise current users early so they don't tune out.
- **My credibility = my workflow and judgment**, not explaining features they can read in docs.
- **Minimal / visual deck.** Many colleagues don't read TypeScript → **almost no code on slides.**
  - Slides = section title + one big idea + maybe a diagram.
  - When code is unavoidable: tiny snippet, narrated in plain language.
  - **The live terminal is the main visual** — language-agnostic, watching it work carries the weight.
- **~80% narrated history + slides, ~20% live execution.** Only go live for fast, reliable bits.

### Tooling decision (updated)
- Deck is built in **Slidev** (Markdown → HTML/Vue), not Keynote. Source: `deck/slides.md`; global look in `deck/style.css` (dark + purple gradient).
- Why the switch: Keynote's AppleScript couldn't reliably set text alignment/styling. Slidev = author in Markdown, real dark theme + gradients, code highlighting, built-in speaker notes + presenter mode, PDF/PNG export. Present straight from it.
- Run: `npm run dev --prefix deck` → http://localhost:3033/ (presenter mode at `/presenter/`).

---

## The arc (6 sections)

### 1. Cold open — "The floor" (3–5 min)
The flawless Asana task: pasted a 300-line ticket, walked away, it finished flawlessly.
Framing: *"The floor is now this high."* Hook + energy. **Not** the spine of the talk.

### 2. "The ceiling" — the failure (5 min)
The library major-version upgrade: AI struggled 2 days, I fixed it manually. A fail.
Framing: *"Here's where it breaks. The whole game is operating between these two."*
→ This is where I **state the thesis.** Kills hype allergy, builds trust.

### 2.5. The reality — "The middle ground" (4–5 min)
Floor and ceiling are the rare extremes; **99% of real work lives here**, in collaboration.
Two paired examples (keep tight, ~60–90s each, lead with the first):
- **Error-handling refactor** → *I supply the judgment the model doesn't weigh.* Claude's first idea worked but meant patching Redux internals — a maintenance trap on the next major. I caught the long-term cost, gave a rough direction, and it executed perfectly.
- **Global typed side-sheets** → *it expands my solution space / it can teach me.* I had no idea how to do it; after several round trips it produced an elegant solution using Redux tools I didn't know existed.
Key finding (good closing line / slide): **"Sometimes you can rely on it, but mostly you'll need to iterate — or come with a direction."**
Hands off into Section 3: *"so here's how I work in that zone."*

### 3. How I actually work (~15 min) — THE BODY  ✅ BUILT (deck/slides.md, 12 slides)
The workflow narrative. Anchored by the **10k-line PR story**. Tools named only.
Headline the 3 non-obvious moves. Ends on feedback-loop → "wasn't AI" → 80/20 crescendo.
**ADD: one "staying in control" commands slide** after the milestones/review slide (slide 9), before the crescendo. `/rewind` (roll back), `/fork` (branch/explore), `/continue` (resume), `/btw` (inject context). Verify each command's exact behavior before drafting.

### 4. Superpowers (~5–6 min)  — partly built (reveal + pipeline live)
The deep-dive. Show-then-explain (we already teased it on S3 slide 8).
- Reveal — "Remember Superpowers?" + one-line what it is (obra/Prime Radiant, open-source skill collection; `/plugin install superpowers@claude-plugins-official`). "I didn't invent the discipline — I adopted it."
- Pipeline — brainstorm → plan → subagents → TDD → review (diagram, done)
- **Subagents (the meatiest, ~1.5 min):** WHY it matters on long features = context management. One context rots; fresh subagent per task keeps the thread clean. Two-stage review (spec, then quality).
- **TDD (~1 min):** red→green→refactor (deletes code written before the test). Caveat = the punch: *only as good as the test spec you wrote in the plan.*
- **Review (~1 min):** automated review catches the basics before I look → my human review isn't wasted on trivia. (Distinct from my custom review TOOL — that lives in §5.)
- Depth rule: brainstorm light, design/impl plan folded in (covered in §3), subagents deep, TDD + review one slide each.

### 5. Make it yours (~10 min)
**Hinge / opener = the honesty pivot:** "I said a good plan = Claude does it right. Not the whole truth. A plan says WHAT to build, not how WE build. Left alone it invents its own patterns. So how do we enforce ours?"
**Frame = three ways to enforce your patterns (soft → hard):**
- **CLAUDE.md** — always-on project rules (soft, loaded every time)
- **Skills** — on-demand know-how (THE rich part). A skill = a markdown file teaching Claude how *your team* does a thing. Theme: *tribal knowledge → written once → enforced automatically (for the AI and new hires).*
  - **Anatomy slide (minimal, NOT a syntax lesson):** name · **description** · instructions. Highlight the **description** — it's the line the agent matches on to auto-load the skill.
  - **Two ways a skill fires:** (a) **Automatic** — agent reads the description, loads it when the task matches (only names+descriptions sit in context; body loads on demand = progressive disclosure at discovery level). (b) **Manual** — you invoke it yourself.
  - **The auto ones** = our 5 codebase skills (CONFIRMED auto-loaded). Frame by PROBLEM SOLVED, not code (TS-illiterate room): (1) parallel frontend dev w/ no backend — contract + **MSW** mocking; (2) **factories**; (3) **MSW for tests** — handlers you pass data into to assert on (≠ #1); (4) **side-panel animation** orchestration; (5) **testing conventions** skill — already written, add **progressive disclosure**.
  - Craft beat: **progressive disclosure** = how to write skills well (lean entry, load detail on demand).
  - **The manual one / climax: LGTM** — my review tool, invoked as **`/lgtm-review`**. GitHub-like diff + line comments Claude reads back. "Most skills the agent reaches for on its own; this one I trigger myself." "I had a friction, so I built my own skill." Proof of the whole thesis.
- **Hooks** — hard enforcement (code that runs and blocks).
- **Customization** — catch-all.

Rule: each tool = "you saw this in flow — here's the mechanism."

### 6. Security & guardrails (12 min)
Sandboxing, OrbStack / Bromure, the honest trade-off:
**"No convention yet, question of acceptable residual risk, trade-off with usability."**
Engineers respect the honesty of not having it all figured out.

### 7. Close — "What actually matters" (~6 min)
The maturation payoff. RECONTEXTUALIZES the whole talk — frame as evolution, NOT contradiction.
- **The turn:** lately I reach for all that ceremony less.
- **Why:** models got smart enough — a good conversation → a plan; well-scoped work skips the subagent machinery. The ceremony costs time + tokens every loop.
- **Training wheels → a colleague:** frameworks are best when you START (and still right for big/hard work). Over time you know the agent like a teammate — its flaws & strengths — and build around it. **Coding with AI is a relationship.**
- **The skills that outlast any framework (the real takeaway):**
  - Iterate with it — conversation is the core skill
  - Make it answer concisely — eases the back-and-forth
  - When you don't understand, ASK — you learn something, or you catch ITS misunderstanding
  - Write a skill when it keeps missing the same thing
  - **Manage your context** — start fresh when it drifts; don't fill it blindly
    - *presenter note:* the 1M context window is nice but a **noob trap** — just because you can hold a lot doesn't mean you should. Start from scratch when needed to avoid drift / hallucination. BUT each restart costs a context re-creation — so don't fill context blindly in the first place, **especially during brainstorm.**
  - Review, review, review — you own the code, you merge it, you maintain it (at least for now)
- **Match the tool to the task:** different agents / effort levels (home for the "different agent/efforts" idea).
- **Send-off:** end on "you own it" — ties back to the review thesis.
- Frame so it STRENGTHENS §3–§5 (how you build the muscle) rather than undercutting them.
- Length note: adds ~5–6 slides to an already-long deck → strengthens case for trimming §3.

---

## The stories (each teaches one principle)

> Story budget caution: 6 stories total in a 1h talk — keep each tight, lead with the principle, don't over-narrate.

1. **Library upgrade (2-day fail)** → *AI has a competence cliff; knowing where it is = the skill.*
   Placement: **Section 2 (the ceiling).** Counterweight to the Asana task.

2. **Error-handling refactor** → *I supply the judgment the model doesn't weigh (trade-offs / maintainability). Come with a direction.*
   Placement: **Section 2.5 (the middle ground)**, lead example.

3. **Global typed side-sheets** → *It expands my solution space / it can teach me — value comes through iteration, not one shot.*
   Placement: **Section 2.5 (the middle ground)**, second example.

4. **10k-line unreviewable PR → restart bottom-up, smaller 700–1500 line PRs** → *The bottleneck isn't generation, it's planning + reviewability.* (My fault: bad planning, lazy reviewing.)
   Placement: **Launches Section 3.** The hard-won "why" behind the planning discipline.

5. **Built a diff/review tool (GitHub-like) with a skill** — view diff, comment lines, Claude reads my comments → *Friction moved to review, so I tooled the review.*
   Placement: **Anchors Skills (Section 4)**, also a strong near-the-end "I cared enough to build this" beat. Language-agnostic to demo.

---

## My workflow — the 9 steps (Section 3 spine)

1. **Understand requirements** — we built the codebase from scratch, so I hold the whole model in my head.
2. **Think visually first** — Excalidraw schemas *before touching Claude*.
3. **`/brainstorm`** with a basic prompt + screenshot of the schema.
4. **Iterate the design plan** until it's *exactly* what I want — interrogate every unknown, change anything I don't like, don't stop until it's right.
5. **HTML over Markdown for plans** — way more readable (esp. code blocks).
6. **Generate the implementation plan** — split into tasks, mostly sequential, sometimes parallel.
7. **Clear context**, invoke the **subagent-driven development skill** — works task by task.
8. **Milestone reviews** on big/complex tasks — stop, review, fix, continue.
9. **Full review at the end** via my custom review tool.

### The 3 non-obvious moves to headline (the "stealable" gold)
- **"I draw before I prompt."** (whiteboard before chat — a mindset shift)
- **"HTML, not Markdown, for plans."** (tiny, practical, nobody knows it)
- **"The design plan is where I spend the most effort and I don't stop until it's perfect."** ← restates the thesis.

### Principle — "Make the feedback loop fast (it's the agent's senses)"
When the agent works autonomously (steps 7–8), it only knows it succeeded via signal: tests pass, typecheck clean, lint green. That loop is how it self-corrects.
- **Slow loop = blind, slow agent.** 80s tests → every self-correction cycle costs 80s. Fast validation is the substrate the whole "let it work task by task" approach stands on. *I had to sharpen the agent's senses before I could trust it on its own.*
- **Metrics slide (language-agnostic, before/after arrows):**
  - ESLint → **oxlint**: 15s → **400ms**
  - Prettier → **oxfmt**: → **400ms**
  - Test suite: 70–80s → **16s**
- **Funny line to use:** *"AI basically forced us to recreate CI"* — except fast and local, on every loop instead of after the push.
- **Meta-theme callback:** we'd tolerated slow tooling for ages; the agent's need for a tight loop is what finally made us fix it — and now every human on the team benefits too, not just the AI.

---

## Structural risk to manage
Sections 3 and 4 overlap (`/brainstorm`, subagent skill, review tool appear in both).
**Resolution:** Section 3 = the *narrative* (what + why, tools by name only). Section 4 = the *mechanics* (how each works), now that they've been seen in flow.

---

## Open / to decide later
- Exact picks of which live bits to run vs. narrate.
- Whether the close includes an install checklist for colleagues.
- How deep to go on OrbStack vs. Bromure specifics.
