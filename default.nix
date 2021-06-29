{ config ? import ./config.nix
, externalSources ? import ./external { inherit config; }
, buildSet ? config.build.set
, buildInfrastructure ? config.build.infrastructure
, checkMaterialization ? config.infrastructure.haskell-nix.checkMaterialization
}:

let

    bootstrap = import externalSources.nixpkgs-stable {
        config = {}; overlays = [];
    };

    gitIgnores =
        # DESIGN: believe Nixpkgs has a bug processing this special case
        (map (builtins.replaceStrings ["\\#"] ["[#]"])
        (import home/modules/base/programs/git null).ignores);

    sources =
        let
            gi = bootstrap.nix-gitignore;
        in externalSources // {
            shajra-provisioning = gi.gitignoreSource gitIgnores ./.;
        };

    infra = import ./infrastructure {
        inherit checkMaterialization sources;
        infraConfig = config.infrastructure;
    };

    myPkgs = import ./packages.nix infra;

    includeSet = bs: buildSet == bs || buildSet == "all";
    includeInfra = i: buildInfrastructure == i || buildInfrastructure == "all";
    include = bs: i: ps:
        if includeSet bs && includeInfra i then ps else {};

    selectedPkgs =
        (   include "prebuilt" "nixpkgs"     myPkgs.nixpkgs.prebuilt)
        // (include "prebuilt" "haskell-nix" myPkgs.haskell-nix.prebuilt)
        // (include "build"    "nixpkgs"     myPkgs.nixpkgs.build)
        // (include "build"    "haskell-nix" myPkgs.haskell-nix.build)
        // (include "build"    "shajra"      myPkgs.shajra.build);

    pkgs = infra.np.nixpkgs-stable.recurseIntoAttrs selectedPkgs;

in { inherit infra pkgs sources; }
