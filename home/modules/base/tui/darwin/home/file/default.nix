config: pkgs:

let
    fish  = "${config.programs.fish.package}/bin/fish";
in

{
    ".kshrc".text = import ksh/kshrc.nix fish;
}
