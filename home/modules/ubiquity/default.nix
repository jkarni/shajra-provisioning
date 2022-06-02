{ ... }:

let

    build = import ../../.. {};
    infra = build.infra;

in

{
    imports = [
        ./packages
        ./theme
    ];

    home.stateVersion = "22.05";

    nixpkgs.config = infra.np.config;
    nixpkgs.overlays = infra.np.overlays;
}
