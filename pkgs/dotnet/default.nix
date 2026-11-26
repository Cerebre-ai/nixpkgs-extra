{ lib, dotnetCorePackages }:
let
  # NOTE: to generate those files run:
  # nix run .#dotnet-update -- --sdk -o ./pkgs/dotnet/versions/9.0.203.nix 9.0.203
  files = builtins.attrNames (builtins.readDir ./versions);

  # Major versions past Microsoft's end of support, mapped to their EOL date.
  # Kept only for projects that still need them; using one prints a warning.
  eol = {
    # "9" = "2026-11-10";
  };

  warnIfEol =
    version: sdk:
    let
      major = lib.versions.major version;
    in
    if eol ? ${major} then
      lib.warn "dotnet-sdk ${version}: .NET ${major} reached end of support on ${eol.${major}} and no longer receives security fixes. Please upgrade to a supported .NET version." sdk
    else
      sdk;
in
(builtins.listToAttrs (
  map (
    f:
    let
      version = builtins.replaceStrings [ ".nix" ] [ "" ] f;
      name = "dotnet-sdk_${builtins.replaceStrings [ "." ] [ "_" ] version}";
    in
    {
      inherit name;
      value = warnIfEol version (dotnetCorePackages.buildDotnetSdk ./versions/${f}).sdk;
    }
  ) files
))
