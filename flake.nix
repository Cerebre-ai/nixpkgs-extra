{
  description = "nixpkgs-extra km";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = { self, nixpkgs, ... }:
    let
      forAllSystems = function:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
          "x86_64-darwin"
          "aarch64-darwin"
        ]
          (system:
            function (import nixpkgs {
              inherit system;
              config.allowUnfree = true;
            }));
    in
    {
      overlays.default = final: prev: self.packages.${prev.system};
      packages = forAllSystems (pkgs:
        let
          node-packages = pkgs.callPackage ./pkgs/node-packages { };
        in
        {
          azurite = node-packages."azurite-3.29.0";
          csharp-ls = pkgs.callPackage ./pkgs/csharp-ls.nix { };
          vacuum = pkgs.callPackage ./pkgs/vacuum.nix { };
        });
      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShell
          {
            name = "pkgs-extra";

            packages = [
              pkgs.node2nix
            ];
          };
      });
      formatter = forAllSystems (pkgs: pkgs.nixpkgs-fmt);
    };
}
