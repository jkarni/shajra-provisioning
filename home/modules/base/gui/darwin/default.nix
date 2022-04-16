{ config, pkgs, ... }:

let
    build = import ../../../../.. {};
    kitty = build.infra.np.nixpkgs-master.kitty;
in {
    imports = [
        ../../../ubiquity
        ../all
        ../../tui/darwin
    ];

    home.file = import home/file config pkgs;
    home.extraPackages = build.pkgs.base.tui.darwin;

    programs.fish = import programs/fish pkgs;
    programs.kitty = import programs/kitty config kitty;
}
