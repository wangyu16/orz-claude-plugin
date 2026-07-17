#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAMILY="$(cd "$ROOT/.." && pwd)"

skills=(orz-markdown orz-mdhtml orz-slides orz-paged)

source_dir() {
  case "$1" in
    orz-markdown) printf '%s/orz-markdown/orz-markdown-skills' "$FAMILY" ;;
    orz-mdhtml) printf '%s/orz-mdhtml/orz-mdhtml-skills' "$FAMILY" ;;
    orz-slides) printf '%s/orz-slides/orz-slides-skills' "$FAMILY" ;;
    orz-paged) printf '%s/orz-paged/orz-paged-skills' "$FAMILY" ;;
  esac
}

if [[ "${1:-}" == "--check" ]]; then
  for skill in "${skills[@]}"; do
    diff -qr "$(source_dir "$skill")" "$ROOT/skills/$skill"
  done
  printf 'Plugin skills match the canonical family repositories.\n'
  exit 0
fi

for skill in "${skills[@]}"; do
  rsync -a --delete "$(source_dir "$skill")/" "$ROOT/skills/$skill/"
done

printf 'Synchronized all four canonical skills.\n'
