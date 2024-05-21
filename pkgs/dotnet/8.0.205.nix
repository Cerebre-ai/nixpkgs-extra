let
  version = "8.0.205";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "1rpsy9254qr8mg6hgr677ygv84l7ripk8w980p375j1fn0rrxgd8";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "10nld83dhi9y4l8kiki2sxxrj2wjb67w6w6hc9jby84abxndqyld";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "1hivdz71r9smn8w6k8l9h6l998xfpvmw7hz198622fcz22xkgx1i";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "1d92xm7kwqq92g3qb2xlnhyn1yyw6v1f5faqqy882yy8csm1rz9g";
  };
}
