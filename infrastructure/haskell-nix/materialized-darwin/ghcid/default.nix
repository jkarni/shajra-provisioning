{
  pkgs = hackage:
    {
      packages = {
        "wcwidth".revision = (((hackage."wcwidth")."0.0.2").revisions).default;
        "wcwidth".flags.split-base = true;
        "wcwidth".flags.cli = false;
        "pretty".revision = (((hackage."pretty")."1.1.3.6").revisions).default;
        "text".revision = (((hackage."text")."1.2.5.0").revisions).default;
        "array".revision = (((hackage."array")."0.5.4.0").revisions).default;
        "extra".revision = (((hackage."extra")."1.7.10").revisions).default;
        "tasty".revision = (((hackage."tasty")."1.4.2.3").revisions).default;
        "tasty".flags.clock = true;
        "tasty".flags.unix = true;
        "mtl".revision = (((hackage."mtl")."2.2.2").revisions).default;
        "bytestring".revision = (((hackage."bytestring")."0.10.12.1").revisions).default;
        "tagged".revision = (((hackage."tagged")."0.8.6.1").revisions).default;
        "tagged".flags.deepseq = true;
        "tagged".flags.transformers = true;
        "filepath".revision = (((hackage."filepath")."1.4.2.1").revisions).default;
        "terminal-size".revision = (((hackage."terminal-size")."0.3.3").revisions).default;
        "stm".revision = (((hackage."stm")."2.5.0.0").revisions).default;
        "unix-compat".revision = (((hackage."unix-compat")."0.6").revisions).default;
        "unix-compat".flags.old-time = false;
        "call-stack".revision = (((hackage."call-stack")."0.4.0").revisions).default;
        "ghc-prim".revision = (((hackage."ghc-prim")."0.7.0").revisions).default;
        "ghc-boot-th".revision = (((hackage."ghc-boot-th")."9.0.2").revisions).default;
        "base".revision = (((hackage."base")."4.15.1.0").revisions).default;
        "time".revision = (((hackage."time")."1.9.3").revisions).default;
        "async".revision = (((hackage."async")."2.2.4").revisions).default;
        "async".flags.bench = false;
        "process".revision = (((hackage."process")."1.6.13.2").revisions).default;
        "cereal".revision = (((hackage."cereal")."0.5.8.2").revisions).default;
        "cereal".flags.bytestring-builder = false;
        "fsnotify".revision = (((hackage."fsnotify")."0.3.0.1").revisions).default;
        "unbounded-delays".revision = (((hackage."unbounded-delays")."0.1.1.1").revisions).default;
        "hsc2hs".revision = (((hackage."hsc2hs")."0.68.8").revisions).default;
        "hsc2hs".flags.in-ghc-tree = false;
        "base-orphans".revision = (((hackage."base-orphans")."0.8.6").revisions).default;
        "ghc-bignum".revision = (((hackage."ghc-bignum")."1.1").revisions).default;
        "directory".revision = (((hackage."directory")."1.3.6.2").revisions).default;
        "optparse-applicative".revision = (((hackage."optparse-applicative")."0.17.0.0").revisions).default;
        "optparse-applicative".flags.process = true;
        "clock".revision = (((hackage."clock")."0.8.3").revisions).default;
        "clock".flags.llvm = false;
        "rts".revision = (((hackage."rts")."1.0.2").revisions).default;
        "transformers".revision = (((hackage."transformers")."0.5.6.2").revisions).default;
        "template-haskell".revision = (((hackage."template-haskell")."2.17.0.0").revisions).default;
        "hfsevents".revision = (((hackage."hfsevents")."0.1.6").revisions).default;
        "tasty-hunit".revision = (((hackage."tasty-hunit")."0.10.0.3").revisions).default;
        "deepseq".revision = (((hackage."deepseq")."1.4.5.0").revisions).default;
        "unix".revision = (((hackage."unix")."2.7.2.2").revisions).default;
        "ansi-terminal".revision = (((hackage."ansi-terminal")."0.11.3").revisions).default;
        "ansi-terminal".flags.example = false;
        "hashable".revision = (((hackage."hashable")."1.4.0.2").revisions).default;
        "hashable".flags.containers = true;
        "hashable".flags.random-initial-seed = false;
        "hashable".flags.integer-gmp = true;
        "cmdargs".revision = (((hackage."cmdargs")."0.10.21").revisions).default;
        "cmdargs".flags.quotation = true;
        "cmdargs".flags.testprog = false;
        "transformers-compat".revision = (((hackage."transformers-compat")."0.7.1").revisions).default;
        "transformers-compat".flags.two = false;
        "transformers-compat".flags.mtl = true;
        "transformers-compat".flags.four = false;
        "transformers-compat".flags.five = false;
        "transformers-compat".flags.five-three = true;
        "transformers-compat".flags.three = false;
        "transformers-compat".flags.generic-deriving = true;
        "binary".revision = (((hackage."binary")."0.8.8.0").revisions).default;
        "ansi-wl-pprint".revision = (((hackage."ansi-wl-pprint")."0.6.9").revisions).default;
        "ansi-wl-pprint".flags.example = false;
        "containers".revision = (((hackage."containers")."0.6.4.1").revisions).default;
        "colour".revision = (((hackage."colour")."2.3.6").revisions).default;
        };
      compiler = {
        version = "9.0.2";
        nix-name = "ghc902";
        packages = {
          "pretty" = "1.1.3.6";
          "text" = "1.2.5.0";
          "array" = "0.5.4.0";
          "mtl" = "2.2.2";
          "bytestring" = "0.10.12.1";
          "filepath" = "1.4.2.1";
          "stm" = "2.5.0.0";
          "ghc-prim" = "0.7.0";
          "ghc-boot-th" = "9.0.2";
          "base" = "4.15.1.0";
          "time" = "1.9.3";
          "process" = "1.6.13.2";
          "ghc-bignum" = "1.1";
          "directory" = "1.3.6.2";
          "rts" = "1.0.2";
          "transformers" = "0.5.6.2";
          "template-haskell" = "2.17.0.0";
          "deepseq" = "1.4.5.0";
          "unix" = "2.7.2.2";
          "binary" = "0.8.8.0";
          "containers" = "0.6.4.1";
          };
        };
      };
  extras = hackage:
    { packages = { ghcid = ./.plan.nix/ghcid.nix; }; };
  modules = [
    ({ lib, ... }:
      { packages = { "ghcid" = { flags = {}; }; }; })
    ({ lib, ... }:
      {
        packages = {
          "ansi-terminal".components.library.planned = lib.mkOverride 900 true;
          "terminal-size".components.library.planned = lib.mkOverride 900 true;
          "base-orphans".components.library.planned = lib.mkOverride 900 true;
          "cereal".components.library.planned = lib.mkOverride 900 true;
          "extra".components.library.planned = lib.mkOverride 900 true;
          "filepath".components.library.planned = lib.mkOverride 900 true;
          "pretty".components.library.planned = lib.mkOverride 900 true;
          "bytestring".components.library.planned = lib.mkOverride 900 true;
          "call-stack".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
          "array".components.library.planned = lib.mkOverride 900 true;
          "ghcid".components.tests."ghcid_test".planned = lib.mkOverride 900 true;
          "binary".components.library.planned = lib.mkOverride 900 true;
          "ghc-boot-th".components.library.planned = lib.mkOverride 900 true;
          "rts".components.library.planned = lib.mkOverride 900 true;
          "tagged".components.library.planned = lib.mkOverride 900 true;
          "unix".components.library.planned = lib.mkOverride 900 true;
          "hsc2hs".components.exes."hsc2hs".planned = lib.mkOverride 900 true;
          "ghcid".components.exes."ghcid".planned = lib.mkOverride 900 true;
          "directory".components.library.planned = lib.mkOverride 900 true;
          "time".components.library.planned = lib.mkOverride 900 true;
          "cmdargs".components.library.planned = lib.mkOverride 900 true;
          "unix-compat".components.library.planned = lib.mkOverride 900 true;
          "ghcid".components.library.planned = lib.mkOverride 900 true;
          "ghc-bignum".components.library.planned = lib.mkOverride 900 true;
          "fsnotify".components.library.planned = lib.mkOverride 900 true;
          "tasty-hunit".components.library.planned = lib.mkOverride 900 true;
          "process".components.library.planned = lib.mkOverride 900 true;
          "clock".components.library.planned = lib.mkOverride 900 true;
          "template-haskell".components.library.planned = lib.mkOverride 900 true;
          "stm".components.library.planned = lib.mkOverride 900 true;
          "async".components.library.planned = lib.mkOverride 900 true;
          "hfsevents".components.library.planned = lib.mkOverride 900 true;
          "wcwidth".components.library.planned = lib.mkOverride 900 true;
          "ansi-wl-pprint".components.library.planned = lib.mkOverride 900 true;
          "mtl".components.library.planned = lib.mkOverride 900 true;
          "unbounded-delays".components.library.planned = lib.mkOverride 900 true;
          "transformers".components.library.planned = lib.mkOverride 900 true;
          "deepseq".components.library.planned = lib.mkOverride 900 true;
          "text".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "tasty".components.library.planned = lib.mkOverride 900 true;
          "transformers-compat".components.library.planned = lib.mkOverride 900 true;
          "colour".components.library.planned = lib.mkOverride 900 true;
          "containers".components.library.planned = lib.mkOverride 900 true;
          "optparse-applicative".components.library.planned = lib.mkOverride 900 true;
          "hashable".components.library.planned = lib.mkOverride 900 true;
          };
        })
    ];
  }