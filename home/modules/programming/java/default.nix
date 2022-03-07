{ ... }:

let build = import ../../../.. {};
in {
    imports = [ ../../ubiquity ];
    home.extraPackages = build.pkgs.programming.java;
}
