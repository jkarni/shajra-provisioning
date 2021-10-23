{ config, pkgs, ... }:

let
    build = import ../../.. {};
    shared = build.home.shared;
in

{
    imports = [ ../../modules/linux ];

    home.file = import home/file config pkgs shared;
    home.homeDirectory = shared.hole.homeDirectory;
    home.username = shared.hole.username;
    programs.alacritty.settings.font.size = 11.0;
    programs.autorandr = import programs/autorandr pkgs.i3-dpi;
    programs.i3status-rust = import programs/i3status-rust config pkgs;
    programs.kitty.extraConfig = "font_size 11";
}
