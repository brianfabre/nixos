#!/usr/bin/env bash
set -euo pipefail

region=$(slurp) || exit 0   # Esc cancels quietly

text=$(grim -g "$region" - | tesseract stdin stdout -l eng 2>/dev/null)

if [[ -n "${text//[[:space:]]/}" ]]; then
  printf '%s' "$text" | wl-copy
  notify-send "OCR" "Copied $(printf '%s' "$text" | wc -m) characters"
else
  notify-send "OCR" "No text found"
fi
