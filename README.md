# lukeblaney_cv
Source for my curriculum vitae

For a rendered version, visit [lukeblaney.co.uk/cv.pdf](http://lukeblaney.co.uk/cv.pdf)

## Structure

`cv-extended.md` is the canonical source of truth — it contains every piece of information that might appear on any version of the CV. It is never submitted to roles directly.

Role-specific variants are curated subsets of the extended CV which emphasise the most relevant experience for a particular type of role. Existing legacy variants (`cv.tex`, `cv-architect.tex`, `cv-manager.tex`, `cv-security.tex`, `cv-tech.tex`) will be replaced by equivalent markdown variants over time.

## Output formats

The build produces:

* `.pdf` files — for human-to-human distribution (e.g. linking from a website, attaching to email)
* `.docx` files — for submission to roles via Applicant Tracking Systems (which parse `.docx` far more reliably than `.pdf`)

## Versioning and Docker image

CV artefacts are published as a versioned Docker image (`docker.io/lucas42/lukeblaney_cv:<version>`) on every merge to `main` that touches files outside `cover-letters/`. Commits whose changes (relative to the latest `v*` tag) are entirely inside `cover-letters/` do not produce a new image — those changes don't affect the built artefacts.

The image contains: `cv.pdf`, `cv-extended.pdf`, `cv.docx`, `cv-extended.docx`, `cv.md`, `cv-extended.md`. Consumers use `COPY --from=lucas42/lukeblaney_cv:<version> /cv.pdf /dest/` at Docker build time.

### Semver semantics

| Change type | Bump | Commit message |
|---|---|---|
| CV content edit | Patch | (no special prefix needed) |
| New CV variant added as an additional file | Minor | (no special prefix needed) |
| CV variant removed or renamed | Major | Include `BREAKING CHANGE` in commit body, or use `feat!:` / `fix!:` prefix |

**Note:** The `lucos_deploy_orb`'s `calc-version` command currently distinguishes only patch vs major (via `BREAKING CHANGE` / `!:` commit syntax). Patch and minor bumps are therefore treated identically in practice — both produce a patch-level version increment. This is safe for the CV's use case because both are backwards-compatible: existing links continue to work, and a new file is simply available for opt-in by future website changes. Minor-bump support in the orb is tracked at [lucas42/lucos_deploy_orb#175](https://github.com/lucas42/lucos_deploy_orb/issues/175).

## Dependencies

* docker

## Building

Run `docker build --output . .` from the repository root. The build will produce a `.pdf` for every variant and a `.docx` for every variant built via pandoc.

## Build-time dependencies (without docker)

* [Pandoc](https://pandoc.org/installing.html) — for building markdown variants
* [LaTeX](https://www.latex-project.org/get/) — used by pandoc to produce PDFs, and for the legacy `.tex` variants

## Building without docker

* `pandoc cv-extended.md -o cv-extended.pdf`
* `pandoc cv-extended.md -o cv-extended.docx`
* `pdflatex cv.tex` (and similarly for any other legacy `.tex` variant)
