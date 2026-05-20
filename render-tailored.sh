#!/bin/bash
# Render a tailored CV or cover letter markdown file to .pdf + .docx using
# the lukeblaney_cv pandoc templates. Outputs land alongside the source.
#
# Usage:
#   render-tailored.sh <path/to/markdown.md>
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
BASE="${INPUT_FILE%.md}"

# Build the pandoc image (target build-stage so we have a shell + tools).
# The image is cached on subsequent runs; -q suppresses the build chatter.
echo "Building pandoc image (cached after first run)..." >&2
docker build --target build-stage -q -t cv-pandoc "$CV_DIR" > /dev/null

# Render PDF: brand-purple headings + hyperlinks via pandoc -V vars
echo "Rendering $BASE.pdf..." >&2
docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "$INPUT_DIR:/work" \
    -w /work \
    cv-pandoc \
    pandoc "$INPUT_FILE" \
        -H /pandoc-pdf-header.tex.template \
        -V fontsize=10pt \
        -V colorlinks=true \
        -V urlcolor=brand \
        -V linkcolor=brand \
        -o "$BASE.pdf"

# Render DOCX: uses the reference template whose Title + Heading + Hyperlink
# styles have been customised to brand purple #330066
echo "Rendering $BASE.docx..." >&2
docker run --rm \
    --user "$(id -u):$(id -g)" \
    -v "$INPUT_DIR:/work" \
    -w /work \
    cv-pandoc \
    pandoc "$INPUT_FILE" \
        --reference-doc=/pandoc-docx-reference.docx.template \
        -o "$BASE.docx"

echo
echo "Done. Artefacts at:"
echo "  $INPUT_DIR/$BASE.pdf  (gitignored — for human review)"
echo "  $INPUT_DIR/$BASE.docx (commit alongside markdown — submission artefact)"
