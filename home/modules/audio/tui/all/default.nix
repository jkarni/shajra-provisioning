{ ... }:

let build = import ../../../../.. {};
in {
    imports = [ ../../../ubiquity ];
    home.extraPackages = build.pkgs.audio.tui.all;
    programs.ncmpcpp.enable = true;
}
