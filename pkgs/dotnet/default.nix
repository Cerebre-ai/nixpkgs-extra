{ fetchurl, system, dotnet-sdk_8 }:
let
  makeDotnet8 = version: url: dotnet-sdk_8.overrideAttrs (oldAttrs: {
    inherit version;
    src = fetchurl url;
  });
in
{
  "sdk-8.0.202" = makeDotnet8 "8.0.202" (import ./8.0.202.nix).${system};
  "sdk-8.0.204" = makeDotnet8 "8.0.204" (import ./8.0.204.nix).${system};
}
