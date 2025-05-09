{
  nixpkgs,
  fetchurl,
  callPackage,
  system,
  dotnetCorePackages,
}:
let
  files = builtins.attrNames (builtins.readDir ./versions);

  makeDotnetSdk =
    orig: version: url:
    let
      # need wrapper only so that sdk will work with combinePackages if needed
      mkWrapper = callPackage "${nixpkgs}/pkgs/development/compilers/dotnet/wrapper.nix" {
        inherit (dotnetCorePackages)
          nugetPackageHook
          ;
      };
    in
    mkWrapper "sdk" (
      orig.overrideAttrs (oldAttrs: {
        inherit version;
        src = fetchurl url;
      })
    );
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
              "8" = makeDotnetSdk dotnetCorePackages.sdk_8_0-bin.unwrapped;
              "9" = makeDotnetSdk dotnetCorePackages.sdk_9_0-bin.unwrapped;
            }
            ."${major}";
        in
        maker version (import ./versions/${f}).${system};
    }
  ) files
))
