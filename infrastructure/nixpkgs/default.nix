{ infraConfig
, sources
, isDarwin
}:

let

    # DESIGN: downloading the latest hashes is time-consuming
    #overlay.all-cabal-hashes = self: super: {
    #    all-cabal-hashes = sources.all-cabal-hashes;
    #};

    overlay.emacs = import sources.emacs-overlay;
    overlay.nix-project = self: super:
        let system = super.stdenv.system;
        in {
            nix-project-lib =
                (import sources.nix-project).lib."${system}".scripts;
        };
    overlay.upgrades = self: super: {
        hasklig = super.hasklig.overrideAttrs (old: {
            url = sources.hasklig.url;
            sha256 = sources.hasklig.sha256;
        });
        home-manager = super.home-manager.overrideAttrs (old: rec {
            # DESIGN: from home-manager/home-manager/default.nix
            src = sources.home-manager;
            nativeBuildInputs = old.nativeBuildInputs ++ [self.gettext];
            installPhase = ''
                install -v -D -m755 \
                    ${src}/home-manager/home-manager \
                    $out/bin/home-manager

                substituteInPlace $out/bin/home-manager \
                    --subst-var-by bash "${self.bash}" \
                    --subst-var-by DEP_PATH "${
                        self.lib.makeBinPath [
                            self.coreutils
                            self.findutils
                            self.gettext
                            self.gnused
                            self.less
                            self.ncurses
                            self.nixos-option
                        ]
                    }" \
                    --subst-var-by HOME_MANAGER_LIB '${src}/lib/bash/home-manager.sh' \
                    --subst-var-by HOME_MANAGER_PATH '${src}' \
                    --subst-var-by OUT "$out" \

                install -D -m755 home-manager/completion.bash \
                    "$out/share/bash-completion/completions/home-manager"
                install -D -m755 home-manager/completion.zsh \
                    "$out/share/zsh/site-functions/_home-manager"
                install -D -m755 home-manager/completion.fish \
                    "$out/share/fish/vendor_completions.d/home-manager.fish"

                install -D -m755 lib/bash/home-manager.sh \
                    "$out/share/bash/home-manager.sh"

                for path in home-manager/po/*.po
                do
                    lang="''${path##*/}"
                    lang="''${lang%%.*}"
                    mkdir -p "$out/share/locale/$lang/LC_MESSAGES"
                    msgfmt -o "$out/share/locale/$lang/LC_MESSAGES/home-manager.mo" "$path"
                done
            '';
        });
        skhd = super.skhd.overrideAttrs (old: { src = sources.skhd; });
        #yabai = super.yabai.overrideAttrs (old: {
        #    src = sources.yabai;
        #    postPatch = ''
        #        substituteInPlace makefile --replace \
        #            ' -arch arm64e ' \
        #            ' '
        #        #substituteInPlace makefile --replace \
        #        #    ' -arch arm64' \
        #        #    ""
        #        substituteInPlace makefile --replace \
        #            'xcrun clang ' \
        #            "clang "
        #    '';
        #});
        moneydance-dist = sources.moneydance;
        dircolors-solarized = sources.dircolors-solarized;
    };

    overlay.provided = import ./overlay;

    overlays = with overlay; [
        nix-project
        emacs
        upgrades
        provided
    ];

    config = infraConfig.nixpkgs // {
        packageOverrides = pkgs: {
            nur = import sources.nur { inherit pkgs; };
        };
    };

    mkNixpkgs = s: import s { inherit config overlays; };

    nixpkgs-stable   = mkNixpkgs sources.nixpkgs-stable;
    nixpkgs-unstable = mkNixpkgs sources.nixpkgs-unstable;
    nixpkgs-master = mkNixpkgs sources.nixpkgs-master;
    nixpkgs-home = mkNixpkgs sources.nixpkgs-home;
    nixpkgs-system = mkNixpkgs sources.nixpkgs-system;

    lib = nixpkgs-stable.lib;

    pickPkgs = pkgs:
        if pkgs == "stable"
        then nixpkgs-stable
        else if pkgs == "home"
        then nixpkgs-home
        else if pkgs == "system"
        then nixpkgs-system
        else nixpkgs-unstable;

    v = infraConfig.hackage.version;

    # DESIGN: not used any more, but maybe later
    hsOverrides.ghc865 = hs: hs.packages.ghc865.override {
        overrides = hSelf: hSuper: {
        };
    };

in {

    inherit
        nixpkgs-stable
        nixpkgs-unstable
        nixpkgs-master
        nixpkgs-home
        nixpkgs-system;

    inherit config overlays;

    pick = {linux ? null, darwin ? null}: paths:
        let pkgs =
                if (isDarwin && ! builtins.isNull darwin)
                then pickPkgs darwin
                else if (! isDarwin && ! builtins.isNull linux)
                then pickPkgs linux
                else {};
            pick' = p:
                let path = lib.splitString "." p;
                    attrName = lib.concatStrings (lib.intersperse "-" path);
                    pkg = lib.getAttrFromPath path pkgs;
                in { "${attrName}" = pkg; };
            paths' =
                if (isDarwin && ! builtins.isNull darwin)
                    || (! isDarwin && ! builtins.isNull linux)
                then paths
                else [];
        in lib.fold (a: b: a // b) {} (map pick' paths');

    hs.fromTopLevel = nixpkgsName: hsPkgName:
        let pkgs = pickPkgs nixpkgsName;
        in {
            ${hsPkgName} = pkgs.haskell.lib.justStaticExecutables
                pkgs."${hsPkgName}";
        };

    hs.fromPackages = nixpkgsName: ghcVersion: hsPkgName:
        let hs = (pickPkgs nixpkgsName).haskell;
            hsOverridesDefault = hs: hs.packages.${ghcVersion};
            hsPkgs = (hsOverrides."${ghcVersion}" or hsOverridesDefault) hs;
        in {
            ${hsPkgName} =
                hs.lib.justStaticExecutables hsPkgs."${hsPkgName}";
        };

}
