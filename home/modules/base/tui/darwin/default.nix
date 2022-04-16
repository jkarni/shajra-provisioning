{ config, lib, pkgs, ... }:

let build = import ../../../../.. {};
in {
    imports = [
        ../../../ubiquity
        ../all
    ];

    home.activation = import home/activation config lib pkgs;
    home.extraPackages = build.pkgs.base.tui.darwin;
}
