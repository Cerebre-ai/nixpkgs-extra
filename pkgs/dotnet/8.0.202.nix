let
  version = "8.0.202";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "07pf6kcwf7h69a34acwjzk7672lmzlz971nhxz7253kn1g30r7ga";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "0fy0b0zg93vvmdxmzv0yzd4hnpnnq3mq6zb603a21y8gqcnzk62j";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "18d6k4v07qw6573c46ipggg1ajfir49zlz5idh8yygbzxarggafy";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "11y3k07fwal9xig74ncmww2v3zv10isgg9s4nw5rdqy6x9vz8mlg";
  };
}
