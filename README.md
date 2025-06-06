[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/linux.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)
[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/darwin.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)

# nixpkgs-extra

Hosts packages:

- azurite (only latest)
- cobertura-total-coverage (a small custom program to calculate total coverage from cobertura reports and print it in percentages for Gitlab CI)
- terraform (only latest) to lock the version, for personal use
- various dotnet 8 SDK patch versions
- various dotnet 9 SDK patch versions

## How to add new dotnet version

### Automatically

An GH action is run automatically daily and detects new versions.
As soon as they are released and found, a PR to this repo is created. One just needs to accept it.

### Manually

If for some reason you want to do this manually, you can either:

- go to Actions -> Update Dotnet Versions -> click "Run workflow".
- or to do it locally:

Call the below script with the proper version argument:

```bash
# an example
$ nix run .#dotnet-update -- --sdk -o ./pkgs/dotnet/versions/9.0.203.nix 9.0.203
```

And commit the result.
