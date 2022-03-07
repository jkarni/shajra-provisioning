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
            apply-refact = "latest";
            ghcid = "latest";
            hlint = "latest";
            stylish-haskell = "latest";
        };
        haskell-nix = {
            checkMaterialization = false;
            platformSensitive = [
                "ghcid"
            ];
            # DESIGN: https://github.com/input-output-hk/hackage.nix/blob/master/index-state-hashes.nix
            hackage.index = {
                state = "2022-03-10T00:00:00Z";
                sha256 = "791c93086ab6bc0a74c46380a7226e551e3d7d938f961fd7720ff9d72969eb6a";
            };
            nixpkgs-pin = "nixpkgs-2111";
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
