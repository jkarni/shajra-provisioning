{ ... }:

let build = import ../../../../.. {};
in {
    imports = [ ../../../ubiquity ];
    home.extraPackages = build.pkgs.audio.tui.linux;
}
