# Cover-letter library

Reusable building blocks for tailoring cover letters. Companion to the CV variants in this repo.

## What's here

```
cover-letters/
├── README.md                        — this file
├── template.md                      — the 4-paragraph structural template
└── blocks/
    ├── openers.md                   — anchor-sentence patterns by role archetype
    ├── evidence-stories.md          — concrete situation-action-result stories
    ├── current-focus.md             — "what I'm working on now" variants
    ├── career-break-aside.md        — how to handle the 2025 career break
    └── closes.md                    — closing lines and sign-offs
```

## How to use it

For any new application:

1. Read `template.md` for the structural shape (4 paragraphs, 250–350 words).
2. Pick an opener from `blocks/openers.md` matching the role archetype.
3. Pick one or two stories from `blocks/evidence-stories.md` matching the JD's primary signals.
4. Write a bespoke "why this company" paragraph (no library — this must be original per application).
5. Pick a current-focus variant from `blocks/current-focus.md` matching the JD flavour.
6. Add a career-break aside from `blocks/career-break-aside.md` (or skip it).
7. Close with a line + sign-off from `blocks/closes.md`.

Once `/tailor-cover-letter` is built (see project memory in `~/.claude/agent-memory/career-advisor/project_cover_letter_rebuild.md`), this whole flow will be skill-driven.

## Where the actual letters go

The library here is public and contains no employer names. Per-application drafts — the actual letters you send to specific companies — live in the **private** companion repo `lucas42/lukeblaney_cv_tailored`. Letter drafts and per-company notes live there.

## Rules for editing this library

- **British / Irish English only.** No Americanisms.
- **No employer names** in any file here. The library uses role-archetype and industry-archetype labels. (See `cv-application-privacy` rule in agent memory.)
- **Source-only commits.** No generated PDFs or DOCX in this directory.
- **Mechanical fixes** (spelling, formatting) can be committed without consultation. **Copy changes** (rewording, adding stories, dropping content) need explicit sign-off.
