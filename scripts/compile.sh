#!/usr/bin/env bash
# Usage: compile.sh <path-to-tex-file>
# Compiles the given .tex file, puts artifacts in build/, PDF in output/

set -e

TEX_FILE="$1"
if [ -z "$TEX_FILE" ]; then
  echo "Usage: $0 <path-to-tex-file>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$(dirname "$(realpath "$TEX_FILE")")"
DOCNAME="$(basename "$TEX_FILE" .tex)"

BUILD_DIR="$PROJECT_ROOT/build"
OUTPUT_DIR="$PROJECT_ROOT/output"

mkdir -p "$BUILD_DIR" "$OUTPUT_DIR"

echo ">> Compiling $DOCNAME..."

# Pass 1: pdflatex (generates .aux, .bcf etc in build/)
pdflatex --interaction=nonstopmode --output-directory="$BUILD_DIR" "$TEX_FILE"

# Pass 2: biber for bibliography
biber --input-directory="$BUILD_DIR" --output-directory="$BUILD_DIR" "$DOCNAME" || true

# Pass 3: pdflatex again to resolve references
pdflatex --interaction=nonstopmode --output-directory="$BUILD_DIR" "$TEX_FILE"

# Move PDF to output/
mv "$BUILD_DIR/$DOCNAME.pdf" "$OUTPUT_DIR/$DOCNAME.pdf"

echo ">> Done! PDF saved to output/$DOCNAME.pdf"
