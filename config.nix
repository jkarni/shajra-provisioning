{
    # Which packages to build and include
    # DESIGN: to build sets in parellel in CI
    build = {
        # Options:
        #     - "all": include everything
        #     - "prebuilt": limit to packages expected prebuilt/cached
        #     - "build": limit to packages expected fresh builds
        set = "all";
        # Options:
        #     - "all": include all infrastructure
        #     - "nixpkgs": limit to packages from Nixpkgs
        #     - "haskell-nix": limit to packages built with Haskell.nix
        #     - "shajra": limit to https://github.com/shajra projects
        infrastructure = "all";
        dev = false;  # true, to skip Haskell.nix build for a faster dev cycle
    };

    infrastructure = {
        hackage.version = {
            apply-refact    = "latest";
            fast-tags       = "latest";
            ghcid           = "latest";
            hlint           = "latest";
            stylish-haskell = "latest";
        };
        haskell-nix = {
            checkMaterialization = false;
            platformSensitive = [
                "ghcid"
            ];
            # DESIGN: https://github.com/input-output-hk/hackage.nix/blob/master/index-state-hashes.nix
            hackage.index = {
                state = "2022-09-26T00:00:00Z";
                sha256 = "8193e6d98e97704d7c6546f43d524c0305dc8454d3d7f92cb8ac1435fd59f08d";
            };
            nixpkgs-pin = "nixpkgs-unstable";
        };
        nixpkgs = {
            allowUnfree = true;
            ungoogled-chromium = {
                enablePepperFlash = false;
            };
            firefox = {
                enableTridactylNative = true;
            };
        };
    };

    # Options for nixos-rebuild, darwin-rebuild, home-manager provisioning
    provision = {
        # Which version of Nixpkgs passed to NixOS-style modules as 'pkgs'.
        # Specific versions are specificed in external/sources.json.
        # Options:
        #     - "stable-darwin": nixpkgs-$RELEASE_VERSION-darwin
        #     - "stable-linux": nixos-$RELEASE_VERSION
        #     - "unstable": nixpkgs-unstable
        pkgs = {
            system = {
                darwin = "unstable";
                linux = "stable-linux";
            };
            home = {
                darwin = "unstable";
                linux = "unstable";
            };
        };
    };
}
