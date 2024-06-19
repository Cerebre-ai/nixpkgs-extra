let
  version = "8.0.302";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "0mbzncra4fcan97c1sy2hd2skcfm30727fgb7m37ir5vgc73914c";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "0ds330r4b6ilj9l6r0scznk10qadwb5hfndykccikw0fdqhv3icc";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0qfp8jfp2ayz0iyix8m5rmnszkjp50h4y82544aaqk30wigmfg8q";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "1f9ysdqgc7qi2sw9qw6zr6lrcjpypwmvqhsx7k7sfhgzqs96fy0a";
  };
}
