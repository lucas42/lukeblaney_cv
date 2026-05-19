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
