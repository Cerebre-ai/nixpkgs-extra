let
  version = "8.0.400";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "05xg132wrz0rkffkpiwqn2v5wv64d09qfzv6s0418i43cdlrx391";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "0mldv19kb9nhc8r8qf2v6i35zg598c695xwwfbw8apqad4r3y4pn";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0zldzm7270j3fwx5drmpvnyi02qn1cg901cvrbbcf30kchlpmkp3";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "183bv98b1zlcnjpxc60297i2cqcrivfn5cq6lpd0f4dbsvkwmgkq";
  };
}
