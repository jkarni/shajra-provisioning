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

    # DESIGN: waiting on PR #166661 to hit nixpkgs-unstable
    programs.kitty = import programs/kitty config kitty;
}
