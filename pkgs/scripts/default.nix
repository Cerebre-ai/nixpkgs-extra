{ pkgs, ... }:
let
  wrapScript =
    {
      name,
      file,
      deps ? [ ],
    }:
    let
      script = (pkgs.writeScriptBin name (builtins.readFile file)).overrideAttrs (old: {
        buildCommand = "${old.buildCommand}\n patchShebangs $out";
      });
    in
    pkgs.symlinkJoin {
      inherit name;
      paths = [ script ] ++ deps;
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = "wrapProgram $out/bin/${name} --prefix PATH : $out/bin";
    };

in
{
  cobertura-total-coverage = wrapScript {
    name = "cobertura-total-coverage";
    file = ./cobertura-total-coverage.sh;
    deps = with pkgs; [
      xmlstarlet
      bc
    ];
  };
  wait-for-it = wrapScript {
    name = "wait-for-it";
    file = ./wait-for-it.sh;
    deps = with pkgs; [ netcat ];
  };
}
