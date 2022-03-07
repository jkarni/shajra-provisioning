{ config, ... }:

let build = import ../../../.. {};
in {
    imports = [ ../../ubiquity ];
    home.file = import home/file config.home.homeDirectory;
    home.extraPackages = build.pkgs.programming.db;
}
