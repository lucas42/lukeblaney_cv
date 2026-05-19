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

COPY *.tex *.md *.template ./

# Legacy LaTeX role-variant builds (PDF only). These will be retired as
# equivalent markdown variants are derived from cv-extended.md.
RUN pdflatex cv.tex
RUN pdflatex cv-security.tex
RUN pdflatex cv-tech.tex
RUN pdflatex cv-manager.tex
RUN pdflatex cv-architect.tex

# Source-of-truth extended CV, built via pandoc for ATS-clean output.
# .pdf is the human-readable distribution; .docx is for ATS submissions.
# pandoc-pdf-header.tex.template disables LaTeX's mid-word hyphenation so ATS
# keyword matching is not broken by word-wrap (DOCX doesn't need this).
RUN pandoc cv-extended.md -H pandoc-pdf-header.tex.template -V fontsize=10pt -o cv-extended.pdf
RUN pandoc cv-extended.md --reference-doc=pandoc-docx-reference.docx.template -o cv-extended.docx

# Role-specific submission variants. Each is a curated subset of
# cv-extended.md tuned to a particular JD or role archetype.
RUN pandoc cv-staff-engineer.md -H pandoc-pdf-header.tex.template -V fontsize=10pt -o cv-staff-engineer.pdf
RUN pandoc cv-staff-engineer.md --reference-doc=pandoc-docx-reference.docx.template -o cv-staff-engineer.docx

FROM scratch AS export-stage
COPY --from=build-stage *.pdf *.docx /
