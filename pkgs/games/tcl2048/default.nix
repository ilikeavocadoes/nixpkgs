{ lib, stdenv, fetchurl, tcl, tcllib, runtimeShell }:

tcl.mkTclDerivation {
  name = "tcl2048-0.4.0";

  src = fetchurl {
    url = "https://raw.githubusercontent.com/dbohdan/2048.tcl/v0.4.0/2048.tcl";
    sha256 = "53f5503efd7f029b2614b0f9b1e3aac6c0342735a3c9b811d74a5135fee3e89e";
  };

  buildInputs = [ tcllib ];
  phases = "installPhase fixupPhase";

  installPhase = ''
    mkdir -pv $out/bin
    install -m 755 $src $out/bin/2048
  '';

  meta = {
    homepage = "https://github.com/dbohdan/2048.tcl";
    description = "The game of 2048 implemented in Tcl";
    license = lib.licenses.mit;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [ dbohdan ];
  };
}
