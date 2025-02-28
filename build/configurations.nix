inputs: withSystem:

# DESIGN: This library only works when the build's `shajra-provision` attribute
# has been set as the flake's `legacyPackages`.

{

    nixosConfiguration = { system, path }:
        withSystem system ({ config, ... }:
            config.legacyPackages.infra.np.nixpkgs.system.nixos {
                _module.args.build = config.legacyPackages;
                imports = [ path ];
            }
        );

    darwinConfiguration = { system, path }:
        withSystem system ({ config, ... }:
            let pkgs = config.legacyPackages.infra.np.nixpkgs.system;
                lib = pkgs.lib;
            in import "${inputs.nix-darwin}/eval-config.nix"
                { inherit lib; }
                {
                    inherit system pkgs;
                    inputs = {};
                    specialArgs.build = config.legacyPackages;
                    modules = [ path ];
                }
            );

    homeConfiguration = { system, path }:
        withSystem system ({ config, ... }:
            inputs.home-manager.lib.homeManagerConfiguration {
                pkgs = config.legacyPackages.infra.np.nixpkgs.home;
                extraSpecialArgs.build = config.legacyPackages;
                modules = [ path ];
            }
        );

}
