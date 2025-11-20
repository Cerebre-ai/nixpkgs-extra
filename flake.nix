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
      overlays.default = final: prev: {
        extra = self.packages.${prev.system};
      };
      packages = forAllSystems (
        pkgs:
        let
          dotnet-sdks = pkgs.callPackages ./pkgs/dotnet { };
          getLatestFor =
            v: attr:
            let
              lib = pkgs.lib;
              # attr names sorts in ASC
              lastAlphKey = lib.last (
                builtins.filter (e: lib.hasPrefix v attr.${e}.version) (builtins.attrNames attr)
              );
            in
            attr.${lastAlphKey};
        in
        dotnet-sdks
        // {
          cobertura-total-coverage = pkgs.callPackage ./pkgs/cobertura-total-coverage.nix { };

          dotnet-sdk_8 = getLatestFor "8" dotnet-sdks;
          dotnet-sdk_9 = getLatestFor "9" dotnet-sdks;
          dotnet-sdk_10 = getLatestFor "10" dotnet-sdks;
          dotnet-update = (pkgs.callPackage ./pkgs/dotnet/dotnet-update.nix { inherit nixpkgs; });

          # to cache it
          terraform = pkgs.terraform;
        }
      );
      apps = forAllSystems (pkgs: {
        dotnet-update = {
          type = "app";
          program = "${pkgs.lib.getExe self.packages.${pkgs.system}.dotnet-update}";
        };
      });
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell {
          name = "pkgs-extra";

          packages = with pkgs; [
            curl
            jq
            nix
          ];
        };
      });
      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);
    };
}
