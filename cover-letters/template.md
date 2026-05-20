# Cover-letter template

Four short paragraphs. Aim for 250–350 words total. Use the blocks in `blocks/` as raw material, but every letter must be individually crafted — no two openings should ever match.

## File structure

Cover-letter files in `lukeblaney_cv_tailored/orgs/{company-slug}/` use YAML frontmatter for internal metadata, then plain markdown for the letter body. The YAML is invisible to the rendered submission artefact; only the body below the closing `---` reaches the recipient.

```markdown
---
role: {role title from JD}
company: {company name}
drafted: {YYYY-MM-DD}
library-source: lucas42/lukeblaney_cv/cover-letters/
---

Dear {salutation},

{body paragraphs 1–4}

{sign-off},

Luke Blaney
```

Do not put a `# Cover letter — …` H1 at the top of the body. The CV pandoc templates colour H1s in brand purple, which renders as a giant purple heading on the submitted document — exactly what you don't want on a cover letter. Internal "what is this" info belongs in the YAML frontmatter, not the body.

## Salutation

- **`Dear [Name],`** — preferred. 60 seconds on LinkedIn or the company's "About" page usually surfaces the hiring manager or recruiter.
- **`Dear Hiring Manager,`** — acceptable fallback.
- **`Hi,`** — acceptable for informal companies, but signals less effort.
- Nothing — never. Always open with a salutation.

## Paragraph 1 — Anchor (40–60 words)

- Name the specific role (and team, if known) in sentence 1.
- One sharp claim about why *this shape* of role fits you.
- **Do not** open with "I'm a [type of person] who…". That's a LinkedIn-About opener, not a cover-letter opener.
- Every letter's opening sentence should differ from every other letter you've sent.

See `blocks/openers.md` for anchor-sentence patterns by role archetype.

## Paragraph 2 — Evidence (80–120 words)

- One or two concrete stories with outcomes. Not adjectives. Not lists of traits.
- Pick from `blocks/evidence-stories.md` based on which stories the JD's keywords actually want to hear.
- Each story follows situation → action → result. Keep natural numbers (13 years, 100+ microservices, 6 squads, dozens of trains, etc.) — they anchor credibility.
- Better one well-told story than three vague mentions.

## Paragraph 3 — Why this company (60–100 words)

- This is the differentiator. The previous two paragraphs say what you bring; this one shows you actually want *them*.
- Tie to something real: their product, their public engineering material, their domain, their mission, a personal connection.
- A genuine hobby/personal connection (e.g. transport interest for a transport operator, music interest for a music-tech company, public-service alignment for a public-service organisation) is fair game — these tend to lift the letter above the slush pile when the connection is real.
- **Test**: if you can't write 60 specific words about why *this* company, that's a signal not to apply.

## Paragraph 4 — Forward-looking close (40–60 words)

- Lead with what you're working on *now* — the agentic-coding-guardrails work. Use a variant from `blocks/current-focus.md`.
- Career break, if mentioned, demotes to a brief aside *here* — not paragraph 2.
- End with a one-line invitation to talk. See `blocks/closes.md`.

## Sign-off

- **`Kind Regards,`** — neutral, safe.
- **`Thanks for considering my application,`** — slightly warmer, also safe.
- Followed by `Luke Blaney` (or just `Luke` for informal companies).

## Dialect

British / Irish English. Northern Hiberno-English where the choice is ambiguous. Never Americanise spelling or grammar.

## What to avoid

- **Boilerplate openers** that could appear identically in a letter to another company.
- **Adjective-only descriptions of yourself** ("I'm pragmatic", "I work well with stakeholders") without a concrete story behind them.
- **The career break as paragraph 2.** It's no longer the headline; the current-focus work is.
- **Buzzwords like "AI Native", "transformational change", "synergies", "leverage", "step change", "unlock value".** Measured framing reads as more credible. See `luke-voice` feedback memory for the full ban list.
- **Sentences that depend on the CV to parse.** Cover letters must stand alone — many recruiters read them before the CV. See `cover-letter-standalone` feedback memory.
- **Fake-passion claims** ("I find X genuinely motivating") about a company's mission unless Luke has confirmed he actually feels that way. Default to writing about why the *role* is interesting rather than why the company's mission is motivating.
- **Stopping without a close** — every letter needs both a closing line and a sign-off.
