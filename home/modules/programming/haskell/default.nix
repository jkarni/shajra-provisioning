{ config, ... }:

let build = import ../../../.. {};
in {
    imports = [ ../../ubiquity ];
    home.file = import home/file;
    home.extraPackages = build.pkgs.programming.haskell;
    xdg.configFile = import xdg/configFile;
}
