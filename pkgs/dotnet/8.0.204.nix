let
  version = "8.0.204";
  makeUrl = import ./url.nix;
in
{
  x86_64-linux = {
    url = makeUrl "linux-x64" version;
    sha256 = "05fxhm93lm2h3l4hiqrggx2jddqd4p388pfhgh2r9a8i1zf39j0f";
  };
  aarch64-linux = {
    url = makeUrl "linux-arm64" version;
    sha256 = "0bllflslqrwfr8mczbh00qf0kqbf4wch2fhm426pw8byi70v1v66";
  };
  x86_64-darwin = {
    url = makeUrl "osx-x64" version;
    sha256 = "0nch4w3lpm47pdljacnh64ayb755czzx36z2nihb6xng5qipj4yb";
  };
  aarch64-darwin = {
    url = makeUrl "osx-arm64" version;
    sha256 = "0x31khvijdba59993yaq0jmh9nmc3c0lq77g3ihsazrlmvb7gg7q";
  };
}
