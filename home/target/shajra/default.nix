{ lib, ... }:

let
    build = import ../../.. {};
    shared = build.home.shared;
    hostname = "shajra";
in

{
    imports = [
        ../../modules/base/tui/linux

        ../../modules/audio/tui/all
        ../../modules/audio/tui/linux

        ../../modules/chat/tui/all
    ];

    home.homeDirectory = shared."${hostname}".homeDirectory;
    home.username = shared."${hostname}".username;

    programs.git = import programs/git lib;
}
