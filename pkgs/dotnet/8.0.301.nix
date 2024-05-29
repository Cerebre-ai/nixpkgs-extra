let
  version = "8.0.301";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "09vcn5x8dpwrsnsic3awr7d9bpdiry5jmwsdcfwixxb5i07cydyj";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "130g2amzhb8x1ri40bjnmnk96d306hbzv7lvmz7pymjr2w5dd40f";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0xga6mx604lyg224q52lz2hn00xk0yw2ydjrsjzgsbprvm96zmhb";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "11vb8z2dndqac9ap3k4k857b91x4qg23mfc76sj97h7rljca79c6";
  };
}
