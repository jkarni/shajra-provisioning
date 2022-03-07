{ lib, ... }:

let
    build = import ../../.. {};
    shared = build.home.shared;
    hostname = "s-MacBookPro.local";
in

{
    imports = [
        ../../modules/base/gui/darwin

        #../../modules/audio/tui/all

        #../../modules/chat/gui/all
        #../../modules/chat/tui/all

        #../../modules/documentation/all

        #../../modules/os/darwin

        #../../modules/programming/c/all
        #../../modules/programming/db
        #../../modules/programming/general
        #../../modules/programming/haskell
        #../../modules/programming/java
        #../../modules/programming/python
        #../../modules/programming/scala
        #../../modules/programming/shell

        #../../modules/sync
    ];

    home.file = import home/file shared hostname;
    home.homeDirectory = shared."${hostname}".homeDirectory;
    home.username = shared."${hostname}".username;
    programs.alacritty.settings.font.size = 18.0;
    programs.git = import programs/git lib;
    programs.kitty.extraConfig = "font_size 18";
}
