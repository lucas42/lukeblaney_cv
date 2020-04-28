FROM ubuntu:focal AS build-stage

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y texlive-latex-base texlive-latex-extra --no-install-recommends
COPY cv.tex .
RUN pdflatex cv.tex

FROM scratch AS export-stage
COPY --from=build-stage cv.pdf /