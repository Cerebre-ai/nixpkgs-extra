{
  lib,
  curl,
  jq,
  dotnetCorePackages,
  writeShellScriptBin,
}:
writeShellScriptBin "dotnet-update"
  # bash
  ''
    set -eu

    dotnet_versions_url="https://dotnetcli.blob.core.windows.net/dotnet/release-metadata/releases-index.json"
    latest_versions=$(${lib.getExe curl} -s "$dotnet_versions_url" | ${lib.getExe jq} -r '."releases-index"[] | select(."support-phase" == "active") | ."latest-sdk"')
    check_dir="pkgs/dotnet/versions"

    # Iterate through latest versions and check if the file exists
    for version in $latest_versions; do
        filename="''${check_dir}/''${version}.nix"
        if [[ -f "$filename" ]]; then
            echo "File $filename does exist. Skipping $version."
        else
            echo "File $filename does not exist. Adding $version."
            ${lib.getExe dotnetCorePackages.generate-dotnet-sdk} --sdk -o "''${PWD}/''${check_dir}/''${version}.nix" "$version"
        fi
    done
  ''
