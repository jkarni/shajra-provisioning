{ ... }:

let build = import ../../../../../.. {};
in {
    imports = [ ../../../../ubiquity ];
    home.extraPackages = build.pkgs.peripheral.wifi.tui.linux;
}
