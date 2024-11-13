{
  fetchurl,
  system,
  dotnet-sdk_8,
}:
let
  files = builtins.attrNames (builtins.readDir ./versions);

  makeDotnetSdk =
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
      value =
        let
          major = builtins.substring 0 1 version;
          maker =
            {
              "8" = makeDotnetSdk;
              # TODO use 9 here once it's added
              "9" = makeDotnetSdk;
            }
            ."${major}";
        in
        maker version (import ./versions/${f}).${system};
    }
  ) files
))
