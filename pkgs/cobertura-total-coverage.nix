{
  lib,
  xmlstarlet,
  bc,
  writeShellScriptBin,
}:
writeShellScriptBin "cobertura-total-coverage"
  # bash
  ''
    set -eu

    INPUT_FILE="$1"
    COVERAGE_DEC=''$(${lib.getExe xmlstarlet} sel -t -v "number(//coverage/@line-rate)" <''${INPUT_FILE} 2>/dev/null)
    COVERAGE_PCT=''$(echo "100 * $COVERAGE_DEC" | ${lib.getExe bc})
    printf "gitlab-coverage %s%%\n" "$COVERAGE_PCT"
  ''
