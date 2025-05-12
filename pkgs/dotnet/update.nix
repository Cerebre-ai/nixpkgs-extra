{
  pkgs,
  writeShellScript,
}:
writeShellScript "update-dotnet.sh" ''
  cd ${pkgs.path}
  exec ./pkgs/development/compilers/dotnet/update.sh "$@"
''
