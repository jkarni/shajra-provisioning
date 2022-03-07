{ config, pkgs, ... }:

let build = import ../../../../.. {};
in {
    imports = [
        ../../../ubiquity
        ../all
        ../../tui/darwin
    ];

    home.file = import home/file config pkgs;
    home.extraPackages = build.pkgs.base.tui.darwin;
}
