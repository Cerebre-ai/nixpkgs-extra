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
  "sdk-8.0.205" = makeDotnet8 "8.0.205" (import ./8.0.205.nix).${system};
  "sdk-8.0.303" = makeDotnet8 "8.0.303" (import ./8.0.303.nix).${system};
  "sdk-8.0.401" = makeDotnet8 "8.0.401" (import ./8.0.401.nix).${system};
}
