{ config ? import ./config.nix
, externalOverrides ? {}
, buildSet ? config.build.set
, buildInfrastructure ? config.build.infrastructure
, checkMaterialization ? config.infrastructure.haskell-nix.checkMaterialization
}:

let

    external = import ./external { inherit config externalOverrides; };

    home.shared = import home/shared.nix;

    bootstrap = import external.nixpkgs-stable {
        config = {}; overlays = [];
    };

    gitIgnores =
        # DESIGN: believe Nixpkgs has a bug processing this special case
        (map (builtins.replaceStrings ["\\#"] ["[#]"])
        (import home/modules/base/tui/all/programs/git null).ignores)
        ++ ["*.org" "*.md"];

    sources =
        let
            gi = bootstrap.nix-gitignore;
        in external // {
            shajra-provisioning = gi.gitignoreSource gitIgnores ./.;
        };

    infra = import ./infrastructure {
        inherit checkMaterialization sources;
        infraConfig = config.infrastructure;
        isDevBuild = config.build.dev;
    };

    pkgsBuild = import ./packages.nix infra;
    updateMaterialized = pkgsBuild.categorized.sets.updateMaterialized;

    includeSet = bs: buildSet == bs || buildSet == "all";
    includeInfra = i: buildInfrastructure == i || buildInfrastructure == "all";
    include = bs: i:
        if includeSet bs && includeInfra i
        then pkgsBuild."${bs}"."${i}"
        else {};

    ci =
        (   include "prebuilt" "nixpkgs"    )
        // (include "prebuilt" "haskell-nix")
        // (include "build"    "nixpkgs"    )
        // (include "build"    "haskell-nix")
        // (include "build"    "shajra"     );

    pkgs = pkgsBuild.categorized.lists;

in { inherit infra home ci pkgs sources updateMaterialized; }
