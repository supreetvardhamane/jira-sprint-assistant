#!/usr/bin/env bash
# Developed by Coder Coder | Find more projects: https://www.codinzhub.com/projects

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV_PYTHON="${ROOT_DIR}/../.venv-jira-tools/bin/python"

DEFAULT_VALIDATOR="$HOME/.codex/skills/.system/skill-creator/scripts/quick_validate.py"
VALIDATOR="${DEFAULT_VALIDATOR}"

if [[ ! -f "$VALIDATOR" ]]; then
  VALIDATOR="$(find "$HOME" -path '*/skill-creator/scripts/quick_validate.py' 2>/dev/null | head -n 1 || true)"
fi

TARGET="${1:-$ROOT_DIR}"

if [[ ! -x "$VENV_PYTHON" ]]; then
  printf 'Missing venv python at %s\n' "$VENV_PYTHON" >&2
  exit 1
fi

if [[ -z "${VALIDATOR}" || ! -f "$VALIDATOR" ]]; then
  printf 'Could not find skill validator at %s or under %s.\n' "$DEFAULT_VALIDATOR" "$HOME" >&2
  printf 'Install the skill-creator plugin or make sure the Codex tooling is available in your home directory.\n' >&2
  exit 1
fi

exec "$VENV_PYTHON" "$VALIDATOR" "$TARGET"
