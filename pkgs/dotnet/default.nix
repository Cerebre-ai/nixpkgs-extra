{
  fetchurl,
  system,
  dotnet-sdk_8,
}:
let
  files = builtins.attrNames (builtins.readDir ./versions);

  makeDotnetSdk8 =
    version: url:
    dotnet-sdk_8.overrideAttrs (oldAttrs: {
      inherit version;
      src = fetchurl url;
    });
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
      value = makeDotnetSdk8 version (import ./versions/${f}).${system};
    }
  ) files
))
