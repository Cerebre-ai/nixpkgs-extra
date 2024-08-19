{
  fetchurl,
  system,
  dotnet-sdk_8,
}:
let
  makeDotnet8 =
    version: url:
    dotnet-sdk_8.overrideAttrs (oldAttrs: {
      inherit version;
      src = fetchurl url;
    });
in
{
  "sdk-8.0.202" = makeDotnet8 "8.0.202" (import ./8.0.202.nix).${system};
  "sdk-8.0.204" = makeDotnet8 "8.0.204" (import ./8.0.204.nix).${system};
  "sdk-8.0.205" = makeDotnet8 "8.0.205" (import ./8.0.205.nix).${system};
  "sdk-8.0.300" = makeDotnet8 "8.0.300" (import ./8.0.300.nix).${system};
  "sdk-8.0.301" = makeDotnet8 "8.0.301" (import ./8.0.301.nix).${system};
  "sdk-8.0.302" = makeDotnet8 "8.0.302" (import ./8.0.302.nix).${system};
  "sdk-8.0.303" = makeDotnet8 "8.0.303" (import ./8.0.303.nix).${system};
  "sdk-8.0.400" = makeDotnet8 "8.0.400" (import ./8.0.400.nix).${system};
  "sdk-8.0.401" = makeDotnet8 "8.0.401" (import ./8.0.401.nix).${system};
}
