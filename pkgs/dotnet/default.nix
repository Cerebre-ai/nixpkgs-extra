{
  fetchurl,
  system,
  dotnet-sdk_8,
  dotnet-sdk_9,
}:
let
  files = builtins.attrNames (builtins.readDir ./versions);

  makeDotnetSdk8 =
    version: url:
    dotnet-sdk_8.overrideAttrs (oldAttrs: {
      inherit version;
      src = fetchurl url;
    });

  makeDotnetSdk9 =
    version: url:
    dotnet-sdk_9.overrideAttrs (oldAttrs: {
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
      value =
        let
          major = builtins.elemAt version 0;
          maker =
            {
              "8" = makeDotnetSdk8;
              "9" = makeDotnetSdk9;
            }
            ."${major}";
        in
        maker version (import ./versions/${f}).${system};
    }
  ) files
))
