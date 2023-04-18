{
  description = "nixpkgs-extra km";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ self.overlays.${system}.default ];
        };
      in
      rec {
        overlays.default = (final: prev: {
          csharp-ls = self.packages.${system}.csharp-ls;
        });

        packages =
          let
            dotnetTools = pkgs.callPackage ./pkgs/dotnet-tools { };
            dotnetPkg = (with pkgs.dotnetCorePackages; combinePackages [ sdk_7_0 ]);
          in
          {
            csharp-ls = dotnetTools.mkDotnetTool dotnetPkg dotnetTools.tools.csharp-ls;
          };

        devShells = {
          default = pkgs.mkShell
            {
              name = "nixpkgs-extra";

              packages = with pkgs; [
                # formatters/linters
                formatter
                # language-servers
                nil
              ];
            };
        };
        formatter = pkgs.nixpkgs-fmt;
      });
}
