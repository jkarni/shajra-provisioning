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

    home.stateVersion = "21.11";

    nixpkgs.config = infra.np.config;
    nixpkgs.overlays = infra.np.overlays;
}
