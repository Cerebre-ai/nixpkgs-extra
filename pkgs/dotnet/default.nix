{ dotnetCorePackages }:
let
  # NOTE: to generate those files run:
  # nix run .#dotnet-update -- --sdk -o ./pkgs/dotnet/versions/9.0.203.nix 9.0.203
  files = builtins.attrNames (builtins.readDir ./versions);
in
(builtins.listToAttrs (
  builtins.map (
    f:
    let
      version = builtins.replaceStrings [ ".nix" ] [ "" ] f;
      name = "dotnet-sdk_${builtins.replaceStrings [ "." ] [ "_" ] version}";
    in
    {
      inherit name;
      value = (dotnetCorePackages.buildDotnetSdk ./versions/${f}).sdk;
    }
  ) files
))
