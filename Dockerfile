FROM ubuntu:noble AS build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-recommended \
    texlive-latex-extra \
    texlive-fonts-recommended \
    lmodern \
    pandoc \
 && rm -rf /var/lib/apt/lists/*

COPY *.md *.template ./

# Source-of-truth extended CV, built via pandoc for ATS-clean output.
# .pdf is the human-readable distribution; .docx is for ATS submissions.
# pandoc-pdf-header.tex.template disables LaTeX's mid-word hyphenation so ATS
# keyword matching is not broken by word-wrap (DOCX doesn't need this).
RUN pandoc cv-extended.md -H pandoc-pdf-header.tex.template -V fontsize=10pt -V colorlinks=true -V urlcolor=brand -V linkcolor=brand -o cv-extended.pdf
RUN pandoc cv-extended.md --reference-doc=pandoc-docx-reference.docx.template -o cv-extended.docx

# Slimmed-down general-purpose CV — default for website link and
# untargeted outreach. Per-JD tailored variants now live in the
# private lukeblaney_cv_tailored repo.
RUN pandoc cv.md -H pandoc-pdf-header.tex.template -V fontsize=10pt -V colorlinks=true -V urlcolor=brand -V linkcolor=brand -o cv.pdf
RUN pandoc cv.md --reference-doc=pandoc-docx-reference.docx.template -o cv.docx

FROM scratch AS export-stage
COPY --from=build-stage *.pdf *.docx cv*.md /
