{
  description = "nixpkgs-extra km";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  nixConfig = {
    extra-substituters = [ "https://cerebre.cachix.org" ];
    extra-trusted-public-keys = [ "cerebre.cachix.org-1:BaUHZ8t0vpa0AXTStUWbaGHBv92Phc2lBC3CJlC5erM=" ];
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs
          [
            "x86_64-linux"
            "aarch64-linux"
            "x86_64-darwin"
            "aarch64-darwin"
          ]
          (
            system:
            function (
              import nixpkgs {
                inherit system;
                config.allowUnfree = true;
              }
            )
          );
    in
    {
      overlays.default = final: prev: self.packages.${prev.system};
      packages = forAllSystems (
        pkgs:
        let
          dotnet = pkgs.callPackage ./pkgs/dotnet { };
          node-packages = pkgs.callPackage ./pkgs/node-packages { };
        in
        {
          azurite = node-packages."azurite-3.30.0";
          dotnet-sdk_8_0_202 = dotnet."sdk-8.0.202";
          dotnet-sdk_8_0_204 = dotnet."sdk-8.0.204";
          dotnet-sdk_8_0_205 = dotnet."sdk-8.0.205";
          dotnet-sdk_8_0_300 = dotnet."sdk-8.0.300";
          dotnet-sdk_8_0_301 = dotnet."sdk-8.0.301";
          dotnet-sdk_8_0_302 = dotnet."sdk-8.0.302";
        }
      );
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "pkgs-extra";

          packages = [ pkgs.node2nix ];
        };
      });
      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);
    };
}
