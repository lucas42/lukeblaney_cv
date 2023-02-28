# lukeblaney_cv
Source for my curriculum vitae

This repository only contains the latex source - for a rendered version, visit [lukeblaney.co.k/cv.pdf](http://lukeblaney.co.uk/cv.pdf)

## Dependencies

* docker

## Compiling to PDF
Run `docker build --output . .`, the resulting PDFs will be called cv.pdf and cv-extended.pdf

## Build-time Dependencies

* [Latex](https://www.latex-project.org/get/)

## Compilation without docker

* Run `pdflatex cv.tex`, the resulting PDF will be called cv.pdf
* Run `pdflatex cv-extended.tex`, the resulting PDF will be called cv-extended.pdf