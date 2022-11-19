{ pkgs, ... }:

let

    build = import ../../../../.. {};
    sources = build.sources;
    module-lorelei = (import sources.direnv-nix-lorelei).direnv-nix-lorelei-home;

in

{
    imports = [
        ../../../ubiquity
        ../all
        module-lorelei
    ];

    home.extraPackages = build.pkgs.base.tui.linux;

    programs.direnv-nix-lorelei.enable = true;
    programs.emacs.package = pkgs.emacsNativeComp;
    programs.macchina.package = build.pkgSets.base.tui.linux.macchina;

    services.emacs = import services/emacs;

    xdg.mimeApps = import xdg/mimeApps;
}
