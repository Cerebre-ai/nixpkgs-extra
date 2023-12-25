{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "vacuum";
  version = "0.6.3";

  src = fetchFromGitHub {
    owner = "daveshanley";
    repo = "vacuum";
    rev = "v${version}";
    sha256 = "sha256-bDIFq+2L8VImnz75XGCD4pE6lYYIn0Mm8Ns/dMPfCIM=";
  };

  subPackages = [ "./vacuum.go" ];


  vendorHash = "sha256-SxYSh4SCEkDcSi92GqMmtFDEXsMEi+SJHUMuOEDadPI=";

  meta = {
    description = "The world’s fastest and most scalable OpenAPI linter.";
    homepage = "https://quobix.com/vacuum/";
  };
}
