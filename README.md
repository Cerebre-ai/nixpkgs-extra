[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/linux.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)
[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/darwin.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)

# nixpkgs-extra

Hosts packages:

- azurite (only latest)
- terraform (only latest) to lock the version, for personal use
- various dotnet 8 SDK patch versions
- various dotnet 9 SDK patch versions

## How to add new dotnet version

Just call the below script with the proper version argument:

```bash
# an example
$ nix run .#dotnet-update -- --sdk -o ./pkgs/dotnet/versions/9.0.203.nix 9.0.203
```

And commit the result.
