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

    home.file = import home/file config;
    home.homeDirectory = shared."${hostname}".homeDirectory;
    home.username = shared."${hostname}".username;

    programs.git = import programs/git lib;
    programs.i3status-rust = import programs/i3status-rust config pkgs;

    services.gammastep.enable = lib.mkForce false;
    services.gpg-agent.enable = true;
    services.gpg-agent.enableSshSupport = true;

    targets.genericLinux.enable = true;

    xdg.configFile = import xdg/configFile;

    xsession.windowManager.i3 = import xsession/windowManager/i3 config lib;
}
