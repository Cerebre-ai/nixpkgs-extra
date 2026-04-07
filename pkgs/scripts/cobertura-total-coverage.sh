#!/usr/bin/env bash
set -euo pipefail

INPUT_FILE="$1"
COVERAGE_DEC=$(xmlstarlet sel -t -v "number(//coverage/@line-rate)" <"${INPUT_FILE}" 2>/dev/null)
COVERAGE_PCT=$(echo "100 * $COVERAGE_DEC" | bc)
printf "gitlab-coverage %s%%\n" "$COVERAGE_PCT"
