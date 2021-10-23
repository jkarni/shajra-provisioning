{ lib, ... }:

let
    build = import ../../.. {};
    shared = build.home.shared;
in

{
    imports = [ ../../modules/darwin ];

    home.file = import home/file shared;
    home.homeDirectory = shared."EEM099LMBP-1".homeDirectory;
    home.username = shared."EEM099LMBP-1".username;
    programs.alacritty.settings.font.size = 18.0;
    programs.git = import programs/git lib;
    programs.kitty.extraConfig = "font_size 18";
}
