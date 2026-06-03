#!/bin/bash
# Render a tailored CV or cover letter markdown file using the lukeblaney_cv
# pandoc templates. By default, outputs the .docx (the submission artefact
# committed alongside the markdown). Pass --pdf to also generate the .pdf —
# only needed when a specific application or recipient requests a PDF.
#
# Usage:
#   render-tailored.sh <path/to/markdown.md>          # docx only (default)
#   render-tailored.sh --pdf <path/to/markdown.md>    # docx + pdf
#
# For files named cv.md or cover-letter.md (the tailored-repo convention,
# per-role subdirs in lukeblaney_cv_tailored/orgs/{company}/{role}/), the
# outputs use submission-ready names ("Luke Blaney - CV.docx", "Luke Blaney
# - Cover Letter.docx") so the .docx can be uploaded to ATS forms as-is.
# Other filenames produce input-derived output names.
#
# Designed to be called from the /tailor skill,
# but also safe to invoke by hand for ad-hoc rebuilds.

set -euo pipefail

RENDER_PDF=false
while [[ $# -gt 0 ]]; do
    case "$1" in
        --pdf)
            RENDER_PDF=true
            shift
            ;;
        -h|--help)
            echo "Usage: $0 [--pdf] <path/to/markdown.md>" >&2
            exit 0
            ;;
        --)
            shift
            break
            ;;
        -*)
            echo "Unknown flag: $1" >&2
            echo "Usage: $0 [--pdf] <path/to/markdown.md>" >&2
            exit 1
            ;;
        *)
            break
            ;;
    esac
done

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 [--pdf] <path/to/markdown.md>" >&2
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

# Pre-process: convert ASCII double-spaces between sentences to single space
# + U+00A0 (non-breaking space). Pandoc's markdown reader collapses
# consecutive ASCII spaces in text content, so a literal `.  ` (period +
# two spaces) becomes a single space in the rendered output. U+00A0 isn't
# treated as whitespace by the parser and survives into the docx/PDF.
# This lets source files use Luke's preferred typewriter-style double-spacing
# between sentences (period + 2 ASCII spaces) while preserving it through
# the rendering pipeline.
PROCESSED_NAME=".${INPUT_FILE%.md}.processed.md"
PROCESSED_PATH="$INPUT_DIR/$PROCESSED_NAME"
trap "rm -f '$PROCESSED_PATH'" EXIT
python3 - "$ABS_INPUT" "$PROCESSED_PATH" <<'PYEOF'
import re, sys
src, dst = sys.argv[1], sys.argv[2]
with open(src, 'r', encoding='utf-8') as f:
    content = f.read()
# Match sentence-ending punctuation followed by 2 or more ASCII spaces.
# Replace the run of spaces with one ASCII space + U+00A0 — pandoc preserves
# the nbsp, giving a visual double-space in the rendered output.
content = re.sub(r'([.!?]) {2,}', '\\1  ', content)
with open(dst, 'w', encoding='utf-8') as f:
    f.write(content)
PYEOF

# Build the pandoc image (target build-stage so we have a shell + tools).
# The image is cached on subsequent runs; -q suppresses the build chatter.
echo "Building pandoc image (cached after first run)..." >&2
docker build --target build-stage -q -t cv-pandoc "$CV_DIR" > /dev/null

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
    pandoc "$PROCESSED_NAME" \
        --reference-doc=/pandoc-docx-reference.docx.template \
        -o "$OUTPUT_BASE.docx"

# Post-process: tighten bullet indents in the rendered .docx.
#
# Pandoc generates its own numbering.xml entries for bullet lists with
# left=720 hanging=480 (~0.5 inch text indent), regardless of what's in the
# reference template. The template's own bullet style (left=480 hanging=480,
# invisible bullet char) is never used because the template body contains no
# bullet content for pandoc to inherit from.
#
# Result: bullets render with a deep 1/2-inch text indent that looks
# disproportionate in 2-bullet sections (Talks & Panels, Education, short
# role entries). Luke flagged this on 2026-05-23.
#
# Fix: rewrite the .docx's numbering.xml to set left=360 hanging=360 on
# every bullet definition — bullet character sits at the page margin, text
# starts at 1/4 inch. Tightest sensible setting for CV-style short bullets.
#
# The .docx is a zip; we open it in-place, modify numbering.xml, and rewrite.
python3 - "$INPUT_DIR/$OUTPUT_BASE.docx" <<'PYEOF'
import sys, zipfile, re, shutil, tempfile, os
docx_path = sys.argv[1]
with zipfile.ZipFile(docx_path, 'r') as zin:
    members = zin.namelist()
    if 'word/numbering.xml' not in members:
        sys.exit(0)
    numbering = zin.read('word/numbering.xml').decode('utf-8')

# Rewrite every w:ind on a bullet level to left=360 hanging=360. The pattern
# matches any <w:ind w:left="..." w:hanging="..."/> inside a numbering entry.
new_numbering = re.sub(
    r'<w:ind\s+w:left="\d+"\s+w:hanging="\d+"\s*/>',
    '<w:ind w:left="360" w:hanging="360"/>',
    numbering,
)

if new_numbering == numbering:
    sys.exit(0)

# Rewrite the zip: copy every entry except numbering.xml, then add the modified one.
tmp_fd, tmp_path = tempfile.mkstemp(suffix='.docx')
os.close(tmp_fd)
with zipfile.ZipFile(docx_path, 'r') as zin, zipfile.ZipFile(tmp_path, 'w', zipfile.ZIP_DEFLATED) as zout:
    for item in zin.infolist():
        if item.filename == 'word/numbering.xml':
            zout.writestr(item, new_numbering.encode('utf-8'))
        else:
            zout.writestr(item, zin.read(item.filename))
shutil.move(tmp_path, docx_path)
PYEOF

# Render PDF (opt-in, only when --pdf is passed). Brand-purple headings +
# hyperlinks via pandoc -V vars. Lua filter translates EmployerDate
# custom-style divs to a LaTeX environment (the LaTeX writer otherwise
# strips the div, leaving the date line as a normal paragraph with the
# global \parskip). The .docx is the canonical submission artefact for
# every ATS Luke has encountered; the .pdf is only worth generating when a
# specific application or recipient explicitly asks for a PDF.
if [[ "$RENDER_PDF" == "true" ]]; then
    echo "Rendering $OUTPUT_BASE.pdf..." >&2
    docker run --rm \
        --user "$(id -u):$(id -g)" \
        -v "$INPUT_DIR:/work" \
        -v "$CV_DIR/employerdate-filter.lua:/employerdate-filter.lua:ro" \
        -w /work \
        cv-pandoc \
        pandoc "$PROCESSED_NAME" \
            -H /pandoc-pdf-header.tex.template \
            --lua-filter=/employerdate-filter.lua \
            -V fontsize=10pt \
            -V colorlinks=true \
            -V urlcolor=brand \
            -V linkcolor=brand \
            -o "$OUTPUT_BASE.pdf"
fi

echo
echo "Done. Artefacts at:"
echo "  $INPUT_DIR/$OUTPUT_BASE.docx (commit alongside markdown — ATS-ready submission name)"
if [[ "$RENDER_PDF" == "true" ]]; then
    echo "  $INPUT_DIR/$OUTPUT_BASE.pdf  (gitignored — for human review or hand-share)"
fi
