{ checkMaterialization
, infraConfig
, sources
, isDarwin
}:

let

    nixpkgs =
        let hn = import sources."haskell.nix" {};
            nixpkgsSrc = hn.sources."${infraConfig.haskell-nix.nixpkgs-pin}";
            nixpkgsOrigArgs = hn.nixpkgsArgs;
            nixpkgsArgs = nixpkgsOrigArgs // {
                config = {};
                overlays = nixpkgsOrigArgs.overlays ++ [(self: super: {
                    alex = super.haskellPackages.alex;
                    happy = super.haskellPackages.happy;
                })];
            };
        in import nixpkgsSrc nixpkgsArgs;

    haskell-nix = nixpkgs.haskell-nix;

    allExes = pkg: pkg.components.exes;

    planConfigFor = ghcVersion: name: custom:
        let
            materializationBase =
                if checkMaterialization
                then "${sources.shajra-provisioning}/infrastructure/haskell-nix"
                else toString ./.;
            materializedPlatform =
                if builtins.elem name infraConfig.haskell-nix.platformSensitive
                then
                    if isDarwin
                    then "materialized-darwin"
                    else "materialized-linux"
                else "materialized-common";
            materialized = "${materializationBase}/${materializedPlatform}/${name}";
            index-state = infraConfig.haskell-nix.hackage.index.state or null;
            index-sha256 = infraConfig.haskell-nix.hackage.index.sha256 or null;
            modules = custom.modules or defaultModules;
            configureArgs = custom.configureArgs or null;
        in {
            inherit name modules checkMaterialization materialized;
            compiler-nix-name = ghcVersion;
            ${if isNull configureArgs then null else "configureArgs"} = configureArgs;
            ${if isNull index-state then null else "index-state"} = index-state;
            ${if isNull index-sha256 then null else "index-sha256"} = index-sha256;
            sha256map = infraConfig.haskell-nix.sha256map or {};
        };

    hackagePlanConfigFor = ghcVersion: name: custom:
        planConfigFor ghcVersion name custom // {
            version = infraConfig.hackage.version."${name}";
        };

    sourcePlanConfigFor = ghcVersion: name: custom:
        planConfigFor ghcVersion name custom // {
            src = sources."${name}";
        };

    defaultModules = [{ enableSeparateDataOutput = true; }];

    defaultReinstallableLibGhcModules = defaultModules ++ [{
        reinstallableLibGhc = true;
    }];

in rec {

    inherit haskell-nix nixpkgs defaultModules defaultReinstallableLibGhcModules;

    fromHackageCustomized = ghcVersion: name: custom:
        let planConfig = hackagePlanConfigFor ghcVersion name custom;
        in allExes (haskell-nix.hackage-package planConfig);

    fromHackageReinstallableLibGhc = ghcVersion: name:
        fromHackageCustomized ghcVersion name {
            modules = defaultReinstallableLibGhcModules;
        };

    fromHackage = ghcVersion: name:
        fromHackageCustomized ghcVersion name {};

    hackageUpdateMaterializedCustomized = ghcVersion: name: custom:
        let planConfig = hackagePlanConfigFor ghcVersion name custom;
            plan-nix = (haskell-nix.hackage-project planConfig).plan-nix;
        in {
            "${name}-updateMaterialized" = plan-nix.passthru.updateMaterialized;
        };

    hackageUpdateMaterialized = ghcVersion: name:
        hackageUpdateMaterializedCustomized ghcVersion name {};


    fromSourceCustomized = ghcVersion: name: custom:
        let planConfig = sourcePlanConfigFor ghcVersion name custom;
        in allExes (haskell-nix.cabalProject planConfig)."${name}";

    fromSourceReinstallableLibGhc = ghcVersion: name:
        fromSourceCustomized ghcVersion name {
            modules = defaultReinstallableLibGhcModules;
        };

    fromSource = ghcVersion: name:
        fromSourceCustomized ghcVersion name {};

    sourceUpdateMaterializedCustomized = ghcVersion: name: custom:
        let planConfig = sourcePlanConfigFor ghcVersion name custom;
            plan-nix = (haskell-nix.cabalProject' planConfig).plan-nix;
        in {
            "${name}-updateMaterialized" = plan-nix.passthru.updateMaterialized;
        };

    sourceUpdateMaterialized = ghcVersion: name:
        sourceUpdateMaterializedCustomized ghcVersion name {};

}
