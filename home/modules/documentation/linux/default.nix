{ ... }:

let build = import ../../../.. {};
in {
    imports = [ ../../ubiquity ];
    home.extraPackages = build.pkgs.documentation.linux;
    programs.texlive = import programs/texlive;
}
