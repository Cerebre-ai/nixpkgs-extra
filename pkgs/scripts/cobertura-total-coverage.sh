#!/usr/bin/env bash
set -euo pipefail

INPUT_FILE="$1"
COVERAGE_PCT=$(xmlstarlet sel -t -v "100 * number(//coverage/@line-rate)" <"${INPUT_FILE}")
printf "gitlab-coverage %s%%\n" "$COVERAGE_PCT"
