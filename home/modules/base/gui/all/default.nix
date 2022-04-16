{ config, pkgs, ... }:

let build = import ../../../../.. {};
in {
    imports = [
        ../../../ubiquity
        ../../tui/all
    ];

    fonts.fontconfig.enable = true;

    home.extraPackages = build.pkgs.base.gui.all;

    programs.alacritty = import programs/alacritty config pkgs;
    programs.fish = import programs/fish;
    programs.kitty = import programs/kitty config pkgs;
    programs.noti.enable = true;
    programs.urxvt.enable = true;

    xdg.configFile = import xdg/configFile config pkgs;
}
