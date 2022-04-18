{ config, lib, pkgs, ... }:

let

    build = import ../../../../.. {};
    sources = build.sources;

in

{
    imports = [
        ../../../ubiquity
        ../all
        ../../tui/linux
    ];

    gtk = import ./gtk config;

    home.file = import home/file config pkgs sources;
    home.extraPackages = build.pkgs.base.gui.linux;

    programs.bash = import programs/bash;
    programs.firefox = import programs/firefox config pkgs;
    programs.fish = import programs/fish config pkgs;
    programs.i3status-rust.enable = true;
    programs.rofi = import programs/rofi config pkgs;
    programs.zathura.enable = true;

    services.clipmenu.enable = true;
    services.dunst = import services/dunst config pkgs;
    services.flameshot = import services/flameshot config;
    services.gammastep.enable = true;
    services.gammastep.provider = "geoclue2";
    services.gromit-mpx.enable = true;
    services.xsuspender = import services/xsuspender;

    xresources = import ./xresources config pkgs;

    xsession = import ./xsession config pkgs lib;
}
