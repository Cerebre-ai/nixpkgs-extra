let
  version = "8.0.401";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "1ygr563apl2776yjabn0plsvx5fcmb5wb0fnldrqwb9b5n8d6cb2";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "1n3k1a0kyi9y2rgqa627p9kv89sadwxbzbyz2dbab0fn3p74bq2a";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "1rbp6l6r2zk85i45hnb73px56xnl5yb10yfi8cvdc5gs0b5synf6";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "088sl49gqxc9r7w9z6ga4ylph55ybzb2ccahk2lv92za497zbglp";
  };
}
