let
  version = "8.0.402";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "1g38dxfpdza7ymw37d2ngwd2ni8b6468vw7ljcdld831h44hx48h";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "1v0mbjwl4xyf06pv65jhfk1x4hjwviwkz0bvs2z17q5ys3yfxvdy";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "19isgc4djkmi2j04plp0898009cd1yrb31mjzmaph3l7s4di6qg1";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "0s59h2hvvkqizc27fh0wq3y1r1kpfhgasygflasqa2ay3j7g7vyx";
  };
}
