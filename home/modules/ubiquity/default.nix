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

    home.stateVersion = "22.11";

    nixpkgs.config = infra.np.config;
    nixpkgs.overlays = infra.np.overlays;
}
