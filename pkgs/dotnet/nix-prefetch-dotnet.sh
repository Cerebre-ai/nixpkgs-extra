#!/usr/bin/env sh

set -e

version=${1:?"missing arg 1 for version"}

linux_x64_url=https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-linux-x64.tar.gz
linux_x64_hash=$(nix-prefetch-url --type sha256 "$linux_x64_url")

linux_arm64_url=https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-linux-arm64.tar.gz
linux_arm64_hash=$(nix-prefetch-url --type sha256 "$linux_arm64_url")

osx_x64_url=https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-osx-x64.tar.gz
osx_x64_hash=$(nix-prefetch-url --type sha256 "$osx_x64_url")

osx_arm64_url=https://dotnetcli.azureedge.net/dotnet/Sdk/${version}/dotnet-sdk-${version}-osx-arm64.tar.gz
osx_arm64_hash=$(nix-prefetch-url --type sha256 "$osx_arm64_url")

dir=$(dirname "$0")

cat <<EOF >"$dir/versions/$version.nix"
{
  x86_64-linux = {
    url = "$linux_x64_url";
    sha256 = "$linux_x64_hash";
  };
  aarch64-linux = {
    url = "$linux_arm64_url";
    sha256 = "$linux_arm64_hash";
  };
  x86_64-darwin = {
    url = "$osx_x64_url";
    sha256 = "$osx_x64_hash";
  };
  aarch64-darwin = {
    url = "$osx_arm64_url";
    sha256 = "$osx_arm64_hash";
  };
}
EOF
