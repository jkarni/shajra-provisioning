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
        "source-serif"               # serif font to complement Sauce Code Pro
        "symbola"                    # another Unicode fallback font
        # DESIGN: Hasklig is also built from source below
    ];

    nixpkgs.prebuilt.base.gui.darwin = np.pick { darwin = "stable"; } [
    ];

    nixpkgs.prebuilt.base.gui.linux = np.pick { linux = "unstable"; } [
        "brave"
        "devour"
        "dunst"
        "fontpreview"
        "gnome.adwaita-icon-theme"
        "maim"
        "microsoft-edge"
        "pavucontrol"
        "simple-scan"
        "sxiv"
        "vivaldi"
        "vivaldi-ffmpeg-codecs"
        "vivaldi-widevine"
        "xclip"
        "xorg.xdpyinfo"
        "xorg.xev"
        "zoom-us"

        # Fonts
        # DESIGN: 2021-09-21: made Linux-only because of a build problem
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
        "nix-diff"
        "nixfmt"
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
        "macchina"
        "niv"
        "pciutils"
        "powertop"
        "usbutils"
    ];

    nixpkgs.prebuilt.base.tui.darwin = np.pick { darwin = "stable"; } [
        "macchina"  # DESIGN: 2022-11-15: broke on nixpkgs-unstable
    ];

    nixpkgs.prebuilt.chat.gui.all = pickHome [
    ];

    nixpkgs.prebuilt.chat.gui.linux = np.pick { linux = "unstable"; } [
        "discord"
        "element-desktop"
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

        "libreoffice"  # DESIGN: 2022-04-15: broke for Darwin
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
            unstable = pickUnstable [
                "haskell.compiler.ghc924"
                "haskellPackages.djinn"
            ];
        in home // unstable;

    nixpkgs.prebuilt.programming.java = pickUnstable [
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
        # DESIGN: yabai broken for M1
        # https://github.com/koekeishiya/yabai/issues/1054
        #"yabai"

        # DESIGN: Brew skhd seemed more stable for now
        #"skhd"
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
        # DESIGN: 2022-11-26: ghc92/ghc925 not building
        // (np.hs.fromPackages "unstable" "ghc924" "ghc-events")
        // (np.hs.fromPackages "unstable" "ghc924" "haskdogs")
        // (np.hs.fromPackages "unstable" "ghc924" "hasktags")
        // (np.hs.fromPackages "unstable" "ghc924" "hoogle")
        // (np.hs.fromPackages "unstable" "ghc924" "hp2pretty")

        # DESIGN: marked broken, 2022-04-15
        #// (np.hs.fromPackages "unstable" "ghc902" "threadscope")
        ;

    nixpkgs.build.unused.darwin = np.pick { darwin = "stable"; } [
        # DESIGN: emacsMacport broken for M1
        # https://github.com/NixOS/nixpkgs/issues/127902
        #"emacsMacport"
    ];

    nixpkgs.build.unused.linux = np.pick { linux = "unstable"; } [
        "emacsNativeComp"  # TODO: what is native compilation for an M1 Mac?
    ];

    haskell-nix.prebuilt.programming.haskell = {
        # DESIGN: don't use enough to want to think about a cache miss
        #nix-tools = hn.nixpkgs.haskell-nix.nix-tools.ghc902;
    };

    haskell-nix.build.programming.haskell = when (! isDevBuild) (
        {}
        // (hn.fromHackage "ghc924" "fast-tags")
        // (hn.fromHackage "ghc924" "ghcid")
        // (hn.fromHackage "ghc924" "apply-refact")
        // (hn.fromHackage "ghc924" "hlint")
        // (hn.fromHackageCustomized "ghc924" "stylish-haskell" { configureArgs = "-f ghc-lib"; })

        # DESIGN: marked broken in Nixpkgs, doesn't seem to build with
        # Haskell.nix either
        #// (hn.fromHackage "ghc924" "ghc-events-analyze")
    );

    haskell-nix.build.updateMaterialized = when (! isDevBuild) (
        {}
        // (hn.hackageUpdateMaterialized "ghc924" "fast-tags")
        // (hn.hackageUpdateMaterialized "ghc924" "ghcid")
        // (hn.hackageUpdateMaterialized "ghc924" "apply-refact")
        // (hn.hackageUpdateMaterialized "ghc924" "hlint")
        // (hn.hackageUpdateMaterializedCustomized "ghc924" "stylish-haskell" { configureArgs = "-f ghc-lib"; })
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
