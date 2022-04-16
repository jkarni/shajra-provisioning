{ config, pkgs, lib, ... }:

let
    build = import ../../.. {};
    shared = build.home.shared;
    hostname = "shajra";
in

{
    imports = [
        ../../modules/base/gui/linux
    ];

    home.homeDirectory = shared."${hostname}".homeDirectory;
    home.username = shared."${hostname}".username;

    programs.git = import programs/git lib;
    programs.i3status-rust = import programs/i3status-rust config pkgs;

    xdg.configFile = import xdg/configFile;

    xsession.windowManager.i3 = import xsession/windowManager/i3 config lib;
}
