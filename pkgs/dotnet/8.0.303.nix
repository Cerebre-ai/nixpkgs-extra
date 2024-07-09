let
  version = "8.0.303";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "0w7hdr3g15w999hvwm6zkkr2mnl2vnl7rzj84x8z2hjwyxky8ki1";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "09ny87sm2i73ap9v2a5h3ycy0h41lkw3n7lqw344xclpfsd1rlxz";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0xq0dvjmi43nlf1wcy265vny68akvd78h872asxzc3yx79lpn2gw";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "0jc1vxphr401w3s392rhvgbg6s9jqmy5shsa9k65a7g56c41bx66";
  };
}
