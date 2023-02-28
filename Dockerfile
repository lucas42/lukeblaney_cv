FROM ubuntu:focal AS build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y texlive-latex-base texlive-latex-extra --no-install-recommends
COPY *.tex .
RUN pdflatex cv.tex
RUN pdflatex cv-full.tex

FROM scratch AS export-stage
COPY --from=build-stage cv.pdf /
COPY --from=build-stage cv-full.pdf /