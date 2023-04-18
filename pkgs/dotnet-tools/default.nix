{ pkgs, stdenv }:
{
  mkDotnetTool = dotnet: tool:
    let
      drv = { binName, nugetName, dllName, version, arch, sha256 }:
        let
          d = pkgs.fetchzip {
            url = "https://www.nuget.org/api/v2/package/${nugetName}/${version}";
            sha256 = sha256;
            extension = "zip";
            stripRoot = false;
          };
        in
        pkgs.writeScript "${binName}-fake"
          "DOTNET_ROOT=${dotnet} ${dotnet}/dotnet ${d}/tools/${arch}/${dllName}.dll";
    in
    pkgs.runCommand tool.binName { } (
      ''
        mkdir -p $out/bin
        ln -s ${drv tool} $out/bin/${tool.binName}
      ''
    );

  tools = {
    csharp-ls = {
      binName = "csharp-ls";
      nugetName = "csharp-ls";
      dllName = "CSharpLanguageServer";
      version = "0.7.1";
      arch = "net7.0/any";
      sha256 = "sha256-fVbAxcYQdqU8uBn1CE7i1Jv8j7lw5KopwK0Tf5hPag8=";
    };
  };
}
