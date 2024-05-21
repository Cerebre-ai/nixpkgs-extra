let
  version = "8.0.300";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "1ghgg0lr6bhk5a6ai88hqz28pi6b50cpvnzrkkxq95agn16c0akc";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "1kkcciy0hznyadj8px725izqva9y54nli09aqcsc7ncnrgya2l8n";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0fq3yx1w93jpr4nz0iwv64h8v16hc37n2d798pwa0j21ixpxqk9z";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "1gm714cmwv3vppxaqv26a3him48vb1ahs0mzgy7l9qpbz7mfyy0r";
  };
}
