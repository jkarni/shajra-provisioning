{ np
, hn
, sources
, isDarwin
, isDevBuild
}:

let

    lib = np.nixpkgs-stable.lib;

    when = lib.optionalAttrs;

    isDrvSet = s: lib.isAttrs s
        && (lib.any lib.isDerivation (builtins.attrValues s) || s == {});

    flattenDerivations = set:
        builtins.foldl' (acc: a: acc // a) {} (lib.collect isDrvSet set);

    deepMerge = builtins.foldl' (acc: a: lib.recursiveUpdate acc a) {};

    deepDrvSetToList = lib.mapAttrsRecursiveCond
        (s: ! isDrvSet s)
        (_path: s: builtins.attrValues s);

    pickHome = np.pick {
        linux  = "home";
        darwin = "home";
    };

    pickUnstable = np.pick {
        linux  = "unstable";
        darwin = "unstable";
    };

    nixpkgs.prebuilt.audio.tui.all = pickHome [
        "mpc_cli"
    ];

    nixpkgs.prebuilt.audio.tui.linux = np.pick {
        linux = "unstable";
    } [
        "playerctl"
        "ponymix"
        "pulsemixer"
        "whipper"
    ];

    nixpkgs.prebuilt.base.gui.all = pickHome [
        # Fonts
        "emacs-all-the-icons-fonts"  # for Emacs, used automatically by Doom
        "etBook"                     # stylish font from Edward Tufte's books
        "fira"                       # variable font to complement Fira Code
        "font-awesome_5"             # for i3status-rust icons
        "freefont_ttf"               # a Unicode fallback font
        "nerdfonts"                  # developer fonts with lots of icons
        "source-serif-pro"           # serif font to complement Sauce Code Pro
        "symbola"                    # another Unicode fallback font
        # DESIGN: Hasklig is also built from source below
    ];

    nixpkgs.prebuilt.base.gui.darwin = np.pick { darwin = "stable"; } [
    ];

    nixpkgs.prebuilt.base.gui.linux = np.pick { linux = "unstable"; } [
        "devour"
        "dunst"
        "fontpreview"
        "gnome3.adwaita-icon-theme"
        "maim"
        "pavucontrol"
        "simple-scan"
        "sxiv"
        "ungoogled-chromium"  # TODO: home-manager
        "xclip"
        "xorg.xdpyinfo"
        "xorg.xev"

        # Fonts
        # DESIGN: made Linux-only because of a build problem, 2021-09-21
        "twitter-color-emoji"        # for emojis
    ];

    nixpkgs.prebuilt.base.tui.all = pickHome [
        "ansifilter"
        "aspell"
        "aspellDicts.en"
        "aspellDicts.en-computers"
        "aspellDicts.en-science"
        "bzip2"
        "cachix"
        "coreutils"
        "curl"
        "direnv"
        "exa"
        "fd"
        "file"
        "gnugrep"
        "gnupg"  # TODO: home-manager
        "macchina"
        "nix-diff"
        "nixfmt"
        "nnn"
        "paperkey"
        "patchelf"
        "procps"
        "pstree"
        "ripgrep"
        "rsync"
        "scc"
        "tree"
        "unzip"
        "wget"
        "which"
        "yq-go"
    ];

    nixpkgs.prebuilt.base.tui.linux = np.pick { linux = "unstable"; } [
        "entr"
        "fswatch"
        "niv"
        "nix-index"
        "pciutils"
        "powertop"
        "usbutils"
    ];

    nixpkgs.prebuilt.chat.gui.all = pickHome [
    ];

    nixpkgs.prebuilt.chat.gui.linux = np.pick { linux = "unstable"; } [
        "discord"
        "irccloud"
        "signal-desktop"
        "slack"
    ];

    nixpkgs.prebuilt.chat.tui.all = pickHome [
        "slack-term"
    ];

    nixpkgs.prebuilt.documentation.all = pickHome [
        "graphviz"
        "imagemagick"
        "libreoffice"
        "nodePackages.textlint"
        "pandoc"
        "proselint"
        "python38Packages.grip"
        "t-rec"
    ];

    nixpkgs.prebuilt.documentation.linux = np.pick { linux = "unstable"; } [
        "dia"
        "freemind"
        "gimp"
        "inkscape"
        "peek"
    ];

    nixpkgs.prebuilt.programming.c.all = pickHome [
        "cmake"
    ];

    nixpkgs.prebuilt.programming.c.linux = np.pick { linux  = "unstable"; } [
        "gcc"
    ];

    nixpkgs.prebuilt.programming.db = pickUnstable [
        "postgresql"
        "schemaspy"
        "sqlint"
        "sqlite"
    ];

    nixpkgs.prebuilt.programming.general = pickHome [
        "gnumake"
    ];

    nixpkgs.prebuilt.programming.haskell =
        let
            home = pickHome [
                "cabal2nix"
                "cabal-install"
                "stack"
            ];
            unstable = np.pick {
                linux  = "unstable";
                darwin = "unstable";
            } [
                "haskell.compiler.ghc8107"
            ];
        in home // unstable;

    nixpkgs.prebuilt.programming.java = pickUnstable [
        "jdk"
    ];

    nixpkgs.prebuilt.programming.python = pickHome [
        "python3"
    ];

    nixpkgs.prebuilt.programming.scala = pickHome [
        "sbt-extras"
    ];

    nixpkgs.prebuilt.programming.shell = pickHome [
        "shellcheck"
    ];

    nixpkgs.prebuilt.sync = pickHome [
        "unison"
    ];

    nixpkgs.prebuilt.peripheral.wifi.tui.linux = np.pick { linux = "unstable"; } [
        "lan-jelly"
        "wirelesstools"
    ];

    nixpkgs.prebuilt.peripheral.wifi.gui.linux = np.pick { linux = "unstable"; } [
        "wpa_supplicant_gui"
    ];

    nixpkgs.build.base.gui.all = pickHome [
        "hasklig"
        "notify-time"
    ];

    nixpkgs.build.base.gui.darwin = np.pick { darwin = "stable"; } [
        "skhd"
        # DESIGN: yabai broken for M1
        # https://github.com/koekeishiya/yabai/issues/1054
        #"yabai"
    ];

    nixpkgs.build.base.gui.linux = np.pick { linux = "unstable"; } [
        "dunst-osd"
        "i3-dpi"
        "i3status-rust-dunst"
        "i3-workspace-name"
    ];

    nixpkgs.build.base.tui.all = pickHome [
        "shajra-home-manager"
    ];

    nixpkgs.build.base.tui.darwin = np.pick { darwin = "stable"; } [
    ];

    nixpkgs.build.base.tui.linux = np.pick { linux = "unstable"; } [
    ];

    nixpkgs.build.finance = pickHome [
        "moneydance"
    ];

    nixpkgs.build.os.darwin = np.pick { darwin = "stable"; } [
        "shajra-darwin-rebuild"
    ];

    nixpkgs.build.os.nixos = np.pick { linux = "unstable"; } [
        "shajra-nixos-rebuild"
    ];

    nixpkgs.build.programming.general = pickHome [
        "global"
    ];

    nixpkgs.build.wifi.tui.linux = np.pick { linux = "unstable"; } [
        "lan-jelly"
    ];

    nixpkgs.build.programming.haskell = {}
        // (np.hs.fromPackages "unstable" "ghc8107" "djinn")
        // (np.hs.fromPackages "unstable" "ghc8107" "fast-tags")
        // (np.hs.fromPackages "unstable" "ghc8107" "ghc-events")
        // (np.hs.fromPackages "unstable" "ghc8107" "haskdogs")
        // (np.hs.fromPackages "unstable" "ghc8107" "hasktags")
        // (np.hs.fromPackages "unstable" "ghc8107" "hoogle")
        // (np.hs.fromPackages "unstable" "ghc8107" "hp2pretty")

        # DESIGN: marked broken, 2020-11-28
        #// (np.hs.fromPackages "unstable" "ghc8106" "threadscope")
        ;

    nixpkgs.build.unused.darwin = np.pick { darwin = "stable"; } [
        # DESIGN: emacsMacport broken for M1
        # https://github.com/NixOS/nixpkgs/issues/127902
        #"emacsMacport"
    ];

    nixpkgs.build.unused.linux = np.pick { linux = "unstable"; } [
        "emacsGcc"  # TODO: what is native compilation for an M1 Mac?
    ];

    haskell-nix.prebuilt.programming.haskell = {
        # DESIGN: don't use enough to want to think about a cache miss
        #nix-tools = hn.nixpkgs.haskell-nix.nix-tools.ghc8107;
    };

    haskell-nix.build.programming.haskell = when (! isDevBuild) (
        {}
        # DESIGN: broke 2022-03-09, not diagnosed yet
        #// (hn.fromHackage "ghc8107" "apply-refact")
        // (hn.fromHackage "ghc8107" "ghcid")
        // (hn.fromHackage "ghc8107" "hlint")
        // (hn.fromHackage "ghc8107" "stylish-haskell")

        # DESIGN: marked broken in Nixpkgs, doesn't seem to build with
        # Haskell.nix either
        #// (hn.fromHackage "ghc8103" "ghc-events-analyze")
    );

    haskell-nix.build.updateMaterialized = when (! isDevBuild) (
        {}
        # DESIGN: broke 2022-03-09, not diagnosed yet
        #// (hn.hackageUpdateMaterialized "ghc8107" "apply-refact")
        // (hn.hackageUpdateMaterialized "ghc8107" "ghcid")
        // (hn.hackageUpdateMaterialized "ghc8107" "hlint")
        // (hn.hackageUpdateMaterialized "ghc8107" "stylish-haskell")
    );

    shajra.build.programming.haskell =
        let hls = ghcVersion:
                import sources.haskell-hls-nix {
                    inherit ghcVersion;
                    hlsUnstable = false;
                };
            tags = import sources.haskell-tags-nix;
        in when (! isDevBuild) {
            implicit-hie        = (hls "8.10.7").implicit-hie;
            haskell-hls-wrapper = (hls "8.10.7").hls-wrapper;
            haskell-hls-ghc8107 = (hls "8.10.7").hls-renamed;
            haskell-hls-ghc8106 = (hls "8.10.6").hls-renamed;
            haskell-hls-ghc884  = (hls "8.8.4").hls-renamed;
            haskell-hls-ghc865  = (hls "8.6.5").hls-renamed;
            haskell-hls-tags    = tags.haskell-tags-nix-exe;
        };

    shajra.build.audio.gui.linux = when (! isDarwin) (import sources.bluos-nix);

    categorized.sets = deepMerge [
        nixpkgs.prebuilt
        nixpkgs.build
        haskell-nix.prebuilt
        haskell-nix.build
        shajra.build
    ];

    categorized.lists = deepDrvSetToList categorized.sets;

in

{
    prebuilt.nixpkgs     = flattenDerivations nixpkgs.prebuilt;
    prebuilt.haskell-nix = flattenDerivations haskell-nix.prebuilt;

    build.nixpkgs        = flattenDerivations nixpkgs.build;
    build.haskell-nix    = flattenDerivations haskell-nix.build;
    build.shajra         = flattenDerivations shajra.build;

    inherit categorized;
}
