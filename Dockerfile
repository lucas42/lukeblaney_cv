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

COPY *.tex *.md ./

# Legacy LaTeX role-variant builds (PDF only). These will be retired as
# equivalent markdown variants are derived from cv-extended.md.
RUN pdflatex cv.tex
RUN pdflatex cv-security.tex
RUN pdflatex cv-tech.tex
RUN pdflatex cv-manager.tex
RUN pdflatex cv-architect.tex

# Source-of-truth extended CV, built via pandoc for ATS-clean output.
# .pdf is the human-readable distribution; .docx is for ATS submissions.
# pandoc-pdf-header.tex disables LaTeX's mid-word hyphenation so ATS
# keyword matching is not broken by word-wrap (DOCX doesn't need this).
RUN pandoc cv-extended.md -H pandoc-pdf-header.tex -o cv-extended.pdf
RUN pandoc cv-extended.md -o cv-extended.docx

FROM scratch AS export-stage
COPY --from=build-stage *.pdf *.docx /
