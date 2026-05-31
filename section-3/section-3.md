# Section 3 — How I Actually Work (THE BODY)

> Source of truth for slides + speaker notes. We author here, then compile to Keynote.
> Visual direction: **dark mode, subtle gradient toward purple.**
> On-slide text stays sparse (half the room doesn't read TS). Detail lives in speaker notes.

Format per slide:
- **Layout** — Keynote layout to target
- **On-slide** — the (minimal) text that appears
- **Notes** — what Adrien actually says

---

## Slide 1 — Section opener

- **Layout:** Title - Centre
- **On-slide:**
  - Title: `How I actually work`
  - Subtitle: `The part that's still my job`
- **Notes:**
  You've seen the floor, the ceiling, and the messy middle where most real work lives. So the real question is: how do I work in that middle zone, reliably? This is my process. And I'll give you the punchline now, so you listen for it: **almost none of this is about AI.** It's just engineering — I finally have the time to do it properly.

---

## Slide 2 — The 10,000-line PR (the story that launches the section)

- **Layout:** Title - Centre
- **On-slide:**
  - Title: `I once shipped a 10,000-line PR`
  - Subtitle: `Unreviewable.`
- **Notes:**
  Personal project. I let Claude run, kept saying "yes, keep going," and ended up with a single 10,000-line pull request. Completely unreviewable — even by me, and I wrote the prompts. So I threw it away. Started again from zero, bottom-up. But this time I had the whole picture in my head, so I worked in small PRs — 700 to 1,500 lines each. Way easier to review, way easier to trust. And here's the honest part: that wasn't Claude's fault. It was mine. Bad planning, lazy reviewing. The tool just made my bad habits 10,000 lines big, very fast.

---

## Slide 3 — The lesson (sets up the workflow)

- **Layout:** Title - Centre
- **On-slide:**
  - Title: `Generation is cheap now`
  - Subtitle: `Planning and review are the work`
- **Notes:**
  That failure taught me the thing this whole section is about. The bottleneck used to be typing the code. That's gone. Now the bottleneck is two things: **planning** — deciding what to build and how — and **reviewability** — keeping it in chunks a human can actually verify. So my entire workflow is built to protect those two things. Let me walk you through it.
