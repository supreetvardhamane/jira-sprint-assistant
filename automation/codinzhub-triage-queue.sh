#!/usr/bin/env bash
# Developed by Coder Coder | Find more projects: https://www.codinzhub.com/projects

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
exec "$SCRIPT_DIR/codinzhub-run-sprint-guardian.sh" --mode triage-queue "$@"
