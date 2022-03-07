config: pkgs:

let
    kitty = "${pkgs.kitty}/bin/kitty";
    jq    = "${pkgs.jq}/bin/jq";
in

{
    ".skhdrc".text = import skhd/skhdrc.nix kitty jq;
    ".yabairc".source = yabai/yabairc;
    ".yabairc".executable = true;
}
