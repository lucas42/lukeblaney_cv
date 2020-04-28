# lukeblaney_cv
Source for my curriculum vitae

This repository only contains the latex source - for a rendered version, visit [lukeblaney.co.k/cv.pdf](http://lukeblaney.co.uk/cv.pdf)

## Dependencies

* docker

## Compiling to PDF
Run `DOCKER_BUILDKIT=1 docker build --output . .`, the resulting PDF will be called cv.pdf

## Build-time Dependencies

* [Latex](https://www.latex-project.org/get/)

## Compilation without docker

Run `pdflatex cv.tex`, the resulting PDF will be called cv.pdf