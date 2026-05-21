#!/bin/bash
# Render a tailored CV or cover letter markdown file to .pdf + .docx using
# the lukeblaney_cv pandoc templates. Outputs land alongside the source.
#
# Usage:
#   render-tailored.sh <path/to/markdown.md>
#
# For files named cv.md or cover-letter.md (the tailored-repo convention,
# per-role subdirs in lukeblaney_cv_tailored/orgs/{company}/{role}/), the
# outputs use submission-ready names ("Luke Blaney - CV.docx", "Luke Blaney
# - Cover Letter.docx") so the .docx can be uploaded to ATS forms as-is.
# Other filenames produce input-derived output names.
#
# Designed to be called from /tailor-cv and /tailor-cover-letter, but also
# safe to invoke by hand for ad-hoc rebuilds.

set -euo pipefail

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <path/to/markdown.md>" >&2
    exit 1
fi

INPUT="$1"
if [[ ! -f "$INPUT" ]]; then
    echo "Error: $INPUT not found" >&2
    exit 1
fi

# Resolve paths so docker mounts work regardless of where this is invoked from
CV_DIR="$(cd "$(dirname "$(realpath "$0")")" && pwd)"
ABS_INPUT="$(realpath "$INPUT")"
INPUT_DIR="$(dirname "$ABS_INPUT")"
INPUT_FILE="$(basename "$ABS_INPUT")"

# Pick output basename. The tailored-repo convention is per-role subdirs
# containing cv.md / cover-letter.md; the output goes to the submission
# filename. Other markdown files use input-derived names so the script
# stays safe to invoke against arbitrary markdown.
case "$INPUT_FILE" in
    cv.md)
        OUTPUT_BASE="Luke Blaney - CV"
        ;;
    cover-letter.md)
        OUTPUT_BASE="Luke Blaney - Cover Letter"
        ;;
    *)
        OUTPUT_BASE="${INPUT_FILE%.md}"
        ;;
esac

# Build the pandoc image (target build-stage so we have a shell + tools).
# The image is cached on subsequent runs; -q suppresses the build chatter.
echo "Building pandoc image (cached after first run)..." >&2
docker build --target build-stage -q -t cv-pandoc "$CV_DIR" > /dev/null

# Render PDF: brand-purple headings + hyperlinks via pandoc -V vars.
# Lua filter translates EmployerDate custom-style divs to a LaTeX
# environment (the LaTeX writer otherwise strips the div, leaving the
# date line as a normal paragraph with the global \parskip).
echo "Rendering $OUTPUT_BASE.pdf..." >&2
docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "$INPUT_DIR:/work" \
    -v "$CV_DIR/employerdate-filter.lua:/employerdate-filter.lua:ro" \
    -w /work \
    cv-pandoc \
    pandoc "$INPUT_FILE" \
        -H /pandoc-pdf-header.tex.template \
        --lua-filter=/employerdate-filter.lua \
        -V fontsize=10pt \
        -V colorlinks=true \
        -V urlcolor=brand \
        -V linkcolor=brand \
        -o "$OUTPUT_BASE.pdf"

# Render DOCX: uses the reference template whose Title + Heading + Hyperlink
# styles have been customised to brand purple #330066. EmployerDate divs
# are picked up natively by the docx writer (which applies the named
# paragraph style from the reference doc) so no Lua filter is needed for
# the docx render.
echo "Rendering $OUTPUT_BASE.docx..." >&2
docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "$INPUT_DIR:/work" \
    -w /work \
    cv-pandoc \
    pandoc "$INPUT_FILE" \
        --reference-doc=/pandoc-docx-reference.docx.template \
        -o "$OUTPUT_BASE.docx"

echo
echo "Done. Artefacts at:"
echo "  $INPUT_DIR/$OUTPUT_BASE.pdf  (gitignored — for human review or hand-share)"
echo "  $INPUT_DIR/$OUTPUT_BASE.docx (commit alongside markdown — ATS-ready submission name)"
