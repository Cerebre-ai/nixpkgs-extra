[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/linux.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)
[![Actions Status](https://github.com/konradmalik/nixpkgs-extra/actions/workflows/darwin.yml/badge.svg)](https://github.com/konradmalik/nixpkgs-extra/actions)

# nixpkgs-extra

Hosts packages:

-   azurite (only latest)
-   various dotnet 8 SDK patch versions

## How to add new dotnet version

Just call the below script with the proper version argument:

```bash
# an example
$ ./pkgs/dotnet/nix-prefetch-dotnet.sh 8.0.205
```

And commit the result.
