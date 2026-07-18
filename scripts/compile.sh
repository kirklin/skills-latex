#!/usr/bin/env bash
#
# kirklin-latex · compile.sh
#   Compile a .tex file to PDF with latexmk, then optionally render PNG previews.
#
# Usage:
#   scripts/compile.sh FILE.tex [options]
#
# Options:
#   --engine E        Force engine: pdflatex | xelatex | lualatex   (default: auto)
#   --preview         Render one PNG per page (written next to the PDF)
#   --preview-dir D   Directory for the PNGs (implies --preview)
#   --dpi N           Preview resolution in DPI                     (default: 150)
#   --clean           Remove aux files for FILE and exit
#   -h, --help        Show this help
#
# Engine auto-detection: xelatex if the source loads fontspec/xeCJK/polyglossia
# or uses a ctex document class/package (Chinese), lualatex for luacode/luatextra,
# otherwise pdflatex. latexmk handles the number of passes, bibliography
# (bibtex/biber) and cross-references automatically.
#
set -uo pipefail

die() { printf 'compile.sh: %s\n' "$1" >&2; exit 1; }

FILE="" ENGINE="auto" PREVIEW=0 PREVIEW_DIR="" DPI=150 CLEAN=0
while [ $# -gt 0 ]; do
  case "$1" in
    --engine)      ENGINE="${2:-}"; shift 2 ;;
    --preview)     PREVIEW=1; shift ;;
    --preview-dir) PREVIEW=1; PREVIEW_DIR="${2:-}"; shift 2 ;;
    --dpi)         DPI="${2:-}"; shift 2 ;;
    --clean)       CLEAN=1; shift ;;
    -h|--help)     sed -n '2,20p' "$0"; exit 0 ;;
    -*)            die "unknown option: $1 (try --help)" ;;
    *)             FILE="$1"; shift ;;
  esac
done

[ -n "$FILE" ] || die "no .tex file given (try --help)"
[ -f "$FILE" ] || die "file not found: $FILE"
command -v latexmk >/dev/null 2>&1 || die "latexmk not found — install TeX Live"

DIR="$(cd "$(dirname "$FILE")" && pwd)"
BASE="$(basename "$FILE")"
STEM="${BASE%.tex}"

if [ "$CLEAN" = 1 ]; then
  latexmk -C -cd "$DIR/$BASE" >/dev/null 2>&1 || true
  echo "cleaned aux files for $BASE"; exit 0
fi

# --- resolve engine ---------------------------------------------------------
if [ "$ENGINE" = "auto" ]; then
  if grep -qE '\\usepackage(\[[^]]*\])?\{(fontspec|xeCJK|polyglossia|ctex)\}|\\documentclass(\[[^]]*\])?\{ctex(art|rep|book|beamer)\}' "$DIR/$BASE"; then
    ENGINE="xelatex"
  elif grep -qE '\\usepackage(\[[^]]*\])?\{(luacode|luatextra)\}' "$DIR/$BASE"; then
    ENGINE="lualatex"
  else
    ENGINE="pdflatex"
  fi
fi
case "$ENGINE" in
  pdflatex) EFLAG="-pdf" ;;
  xelatex)  EFLAG="-xelatex" ;;
  lualatex) EFLAG="-lualatex" ;;
  *) die "invalid engine: $ENGINE" ;;
esac

# --- compile ----------------------------------------------------------------
echo "→ compiling $BASE  (engine: $ENGINE)"
if ! latexmk "$EFLAG" -interaction=nonstopmode -cd "$DIR/$BASE"; then
  die "compilation failed — inspect $DIR/$STEM.log  (grep '^!' for errors)"
fi

PDF="$DIR/$STEM.pdf"
[ -f "$PDF" ] || die "no PDF produced — inspect $DIR/$STEM.log"
PAGES="$(pdfinfo "$PDF" 2>/dev/null | awk '/^Pages/{print $2}')"
echo "✓ $PDF  (${PAGES:-?} pages)"

# --- previews ---------------------------------------------------------------
if [ "$PREVIEW" = 1 ]; then
  command -v pdftoppm >/dev/null 2>&1 || die "pdftoppm not found — install poppler-utils"
  OUT="${PREVIEW_DIR:-$DIR}"
  mkdir -p "$OUT"
  pdftoppm -png -r "$DPI" "$PDF" "$OUT/${STEM}-page"
  echo "✓ previews: $OUT/${STEM}-page-*.png"
fi
