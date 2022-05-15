{
  pkgs = hackage:
    {
      packages = {
        "happy".revision = (((hackage."happy")."1.20.0").revisions).default;
        "pretty".revision = (((hackage."pretty")."1.1.3.6").revisions).default;
        "regex-posix".revision = (((hackage."regex-posix")."0.96.0.1").revisions).default;
        "regex-posix".flags._regex-posix-clib = false;
        "unordered-containers".revision = (((hackage."unordered-containers")."0.2.19.1").revisions).default;
        "unordered-containers".flags.debug = false;
        "integer-logarithms".revision = (((hackage."integer-logarithms")."1.0.3.1").revisions).default;
        "integer-logarithms".flags.check-bounds = false;
        "integer-logarithms".flags.integer-gmp = true;
        "HUnit".revision = (((hackage."HUnit")."1.6.2.0").revisions).default;
        "dlist".revision = (((hackage."dlist")."1.0").revisions).default;
        "dlist".flags.werror = false;
        "text".revision = (((hackage."text")."1.2.5.0").revisions).default;
        "ghc-lib-parser".revision = (((hackage."ghc-lib-parser")."9.2.2.20220307").revisions).default;
        "array".revision = (((hackage."array")."0.5.4.0").revisions).default;
        "vector".revision = (((hackage."vector")."0.12.3.1").revisions).default;
        "vector".flags.internalchecks = false;
        "vector".flags.wall = false;
        "vector".flags.boundschecks = true;
        "vector".flags.unsafechecks = false;
        "comonad".revision = (((hackage."comonad")."5.0.8").revisions).default;
        "comonad".flags.containers = true;
        "comonad".flags.distributive = true;
        "comonad".flags.indexed-traversable = true;
        "base-compat".revision = (((hackage."base-compat")."0.12.1").revisions).default;
        "contravariant".revision = (((hackage."contravariant")."1.5.5").revisions).default;
        "contravariant".flags.tagged = true;
        "contravariant".flags.semigroups = true;
        "contravariant".flags.statevar = true;
        "base-compat-batteries".revision = (((hackage."base-compat-batteries")."0.12.1").revisions).default;
        "Cabal".revision = (((hackage."Cabal")."3.4.1.0").revisions).default;
        "assoc".revision = (((hackage."assoc")."1.0.2").revisions).default;
        "data-fix".revision = (((hackage."data-fix")."0.3.2").revisions).default;
        "alex".revision = (((hackage."alex")."3.2.7.1").revisions).default;
        "old-locale".revision = (((hackage."old-locale")."1.0.0.7").revisions).default;
        "mtl".revision = (((hackage."mtl")."2.2.2").revisions).default;
        "OneTuple".revision = (((hackage."OneTuple")."0.3.1").revisions).default;
        "parsec".revision = (((hackage."parsec")."3.1.14.0").revisions).default;
        "bytestring".revision = (((hackage."bytestring")."0.10.12.1").revisions).default;
        "strict".revision = (((hackage."strict")."0.4.0.1").revisions).default;
        "strict".flags.assoc = true;
        "aeson".revision = (((hackage."aeson")."2.0.3.0").revisions).default;
        "aeson".flags.ordered-keymap = true;
        "aeson".flags.cffi = false;
        "tagged".revision = (((hackage."tagged")."0.8.6.1").revisions).default;
        "tagged".flags.deepseq = true;
        "tagged".flags.transformers = true;
        "splitmix".revision = (((hackage."splitmix")."0.1.0.4").revisions).default;
        "splitmix".flags.optimised-mixer = false;
        "file-embed".revision = (((hackage."file-embed")."0.0.15.0").revisions).default;
        "attoparsec".revision = (((hackage."attoparsec")."0.14.4").revisions).default;
        "attoparsec".flags.developer = false;
        "filepath".revision = (((hackage."filepath")."1.4.2.1").revisions).default;
        "stm".revision = (((hackage."stm")."2.5.0.0").revisions).default;
        "HsYAML".revision = (((hackage."HsYAML")."0.2.1.1").revisions).default;
        "HsYAML".flags.exe = false;
        "call-stack".revision = (((hackage."call-stack")."0.4.0").revisions).default;
        "ghc-prim".revision = (((hackage."ghc-prim")."0.7.0").revisions).default;
        "ghc-boot-th".revision = (((hackage."ghc-boot-th")."9.0.2").revisions).default;
        "indexed-traversable".revision = (((hackage."indexed-traversable")."0.1.2").revisions).default;
        "distributive".revision = (((hackage."distributive")."0.6.2.1").revisions).default;
        "distributive".flags.tagged = true;
        "distributive".flags.semigroups = true;
        "text-short".revision = (((hackage."text-short")."0.1.5").revisions).default;
        "text-short".flags.asserts = false;
        "bifunctors".revision = (((hackage."bifunctors")."5.5.12").revisions).default;
        "bifunctors".flags.tagged = true;
        "bifunctors".flags.semigroups = true;
        "base".revision = (((hackage."base")."4.15.1.0").revisions).default;
        "time".revision = (((hackage."time")."1.9.3").revisions).default;
        "random".revision = (((hackage."random")."1.2.1.1").revisions).default;
        "process".revision = (((hackage."process")."1.6.13.2").revisions).default;
        "regex-base".revision = (((hackage."regex-base")."0.94.0.2").revisions).default;
        "th-abstraction".revision = (((hackage."th-abstraction")."0.4.3.0").revisions).default;
        "semigroupoids".revision = (((hackage."semigroupoids")."5.3.7").revisions).default;
        "semigroupoids".flags.tagged = true;
        "semigroupoids".flags.containers = true;
        "semigroupoids".flags.distributive = true;
        "semigroupoids".flags.unordered-containers = true;
        "semigroupoids".flags.contravariant = true;
        "semigroupoids".flags.comonad = true;
        "xml".revision = (((hackage."xml")."1.3.14").revisions).default;
        "these".revision = (((hackage."these")."1.1.1.1").revisions).default;
        "these".flags.assoc = true;
        "extensible-exceptions".revision = (((hackage."extensible-exceptions")."0.1.1.4").revisions).default;
        "base-orphans".revision = (((hackage."base-orphans")."0.8.6").revisions).default;
        "ghc-bignum".revision = (((hackage."ghc-bignum")."1.1").revisions).default;
        "time-compat".revision = (((hackage."time-compat")."1.9.6.1").revisions).default;
        "time-compat".flags.old-locale = false;
        "HsYAML-aeson".revision = (((hackage."HsYAML-aeson")."0.2.0.1").revisions).default;
        "HsYAML-aeson".flags.exe = false;
        "primitive".revision = (((hackage."primitive")."0.7.3.0").revisions).default;
        "directory".revision = (((hackage."directory")."1.3.6.2").revisions).default;
        "exceptions".revision = (((hackage."exceptions")."0.10.4").revisions).default;
        "optparse-applicative".revision = (((hackage."optparse-applicative")."0.17.0.0").revisions).default;
        "optparse-applicative".flags.process = true;
        "hostname".revision = (((hackage."hostname")."1.0").revisions).default;
        "ghc-lib-parser-ex".revision = (((hackage."ghc-lib-parser-ex")."9.2.0.3").revisions).default;
        "ghc-lib-parser-ex".flags.no-ghc-lib = false;
        "ghc-lib-parser-ex".flags.auto = true;
        "rts".revision = (((hackage."rts")."1.0.2").revisions).default;
        "semialign".revision = (((hackage."semialign")."1.2.0.1").revisions).default;
        "semialign".flags.semigroupoids = true;
        "transformers".revision = (((hackage."transformers")."0.5.6.2").revisions).default;
        "template-haskell".revision = (((hackage."template-haskell")."2.17.0.0").revisions).default;
        "witherable".revision = (((hackage."witherable")."0.4.2").revisions).default;
        "syb".revision = (((hackage."syb")."0.7.2.1").revisions).default;
        "uniplate".revision = (((hackage."uniplate")."1.6.13").revisions).default;
        "deepseq".revision = (((hackage."deepseq")."1.4.5.0").revisions).default;
        "unix".revision = (((hackage."unix")."2.7.2.2").revisions).default;
        "ansi-terminal".revision = (((hackage."ansi-terminal")."0.11.3").revisions).default;
        "ansi-terminal".flags.example = false;
        "test-framework-hunit".revision = (((hackage."test-framework-hunit")."0.3.0.2").revisions).default;
        "test-framework-hunit".flags.base3 = false;
        "test-framework-hunit".flags.base4 = true;
        "hashable".revision = (((hackage."hashable")."1.4.0.2").revisions).default;
        "hashable".flags.containers = true;
        "hashable".flags.random-initial-seed = false;
        "hashable".flags.integer-gmp = true;
        "transformers-compat".revision = (((hackage."transformers-compat")."0.7.1").revisions).default;
        "transformers-compat".flags.two = false;
        "transformers-compat".flags.mtl = true;
        "transformers-compat".flags.four = false;
        "transformers-compat".flags.five = false;
        "transformers-compat".flags.five-three = true;
        "transformers-compat".flags.three = false;
        "transformers-compat".flags.generic-deriving = true;
        "indexed-traversable-instances".revision = (((hackage."indexed-traversable-instances")."0.1.1").revisions).default;
        "scientific".revision = (((hackage."scientific")."0.3.7.0").revisions).default;
        "scientific".flags.bytestring-builder = false;
        "scientific".flags.integer-simple = false;
        "binary".revision = (((hackage."binary")."0.8.8.0").revisions).default;
        "ansi-wl-pprint".revision = (((hackage."ansi-wl-pprint")."0.6.9").revisions).default;
        "ansi-wl-pprint".flags.example = false;
        "test-framework".revision = (((hackage."test-framework")."0.8.2.0").revisions).default;
        "QuickCheck".revision = (((hackage."QuickCheck")."2.14.2").revisions).default;
        "QuickCheck".flags.old-random = false;
        "QuickCheck".flags.templatehaskell = true;
        "uuid-types".revision = (((hackage."uuid-types")."1.0.5").revisions).default;
        "containers".revision = (((hackage."containers")."0.6.4.1").revisions).default;
        "StateVar".revision = (((hackage."StateVar")."1.2.2").revisions).default;
        "colour".revision = (((hackage."colour")."2.3.6").revisions).default;
        };
      compiler = {
        version = "9.0.2";
        nix-name = "ghc902";
        packages = {
          "pretty" = "1.1.3.6";
          "text" = "1.2.5.0";
          "array" = "0.5.4.0";
          "Cabal" = "3.4.1.0";
          "mtl" = "2.2.2";
          "parsec" = "3.1.14.0";
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
          "exceptions" = "0.10.4";
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
    { packages = { stylish-haskell = ./.plan.nix/stylish-haskell.nix; }; };
  modules = [
    ({ lib, ... }:
      {
        packages = {
          "stylish-haskell" = {
            flags = { "ghc-lib" = lib.mkOverride 900 false; };
            };
          };
        })
    ({ lib, ... }:
      {
        packages = {
          "ansi-terminal".components.library.planned = lib.mkOverride 900 true;
          "HsYAML-aeson".components.library.planned = lib.mkOverride 900 true;
          "base-orphans".components.library.planned = lib.mkOverride 900 true;
          "stylish-haskell".components.library.planned = lib.mkOverride 900 true;
          "these".components.library.planned = lib.mkOverride 900 true;
          "filepath".components.library.planned = lib.mkOverride 900 true;
          "distributive".components.library.planned = lib.mkOverride 900 true;
          "pretty".components.library.planned = lib.mkOverride 900 true;
          "Cabal".components.library.planned = lib.mkOverride 900 true;
          "bytestring".components.library.planned = lib.mkOverride 900 true;
          "strict".components.library.planned = lib.mkOverride 900 true;
          "comonad".components.library.planned = lib.mkOverride 900 true;
          "data-fix".components.library.planned = lib.mkOverride 900 true;
          "xml".components.library.planned = lib.mkOverride 900 true;
          "exceptions".components.library.planned = lib.mkOverride 900 true;
          "call-stack".components.library.planned = lib.mkOverride 900 true;
          "dlist".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
          "HUnit".components.library.planned = lib.mkOverride 900 true;
          "array".components.library.planned = lib.mkOverride 900 true;
          "stylish-haskell".components.exes."stylish-haskell".planned = lib.mkOverride 900 true;
          "test-framework".components.library.planned = lib.mkOverride 900 true;
          "binary".components.library.planned = lib.mkOverride 900 true;
          "stylish-haskell".components.tests."stylish-haskell-tests".planned = lib.mkOverride 900 true;
          "ghc-boot-th".components.library.planned = lib.mkOverride 900 true;
          "scientific".components.library.planned = lib.mkOverride 900 true;
          "splitmix".components.library.planned = lib.mkOverride 900 true;
          "rts".components.library.planned = lib.mkOverride 900 true;
          "tagged".components.library.planned = lib.mkOverride 900 true;
          "unix".components.library.planned = lib.mkOverride 900 true;
          "file-embed".components.library.planned = lib.mkOverride 900 true;
          "vector".components.library.planned = lib.mkOverride 900 true;
          "indexed-traversable-instances".components.library.planned = lib.mkOverride 900 true;
          "regex-base".components.library.planned = lib.mkOverride 900 true;
          "directory".components.library.planned = lib.mkOverride 900 true;
          "happy".components.exes."happy".planned = lib.mkOverride 900 true;
          "time".components.library.planned = lib.mkOverride 900 true;
          "StateVar".components.library.planned = lib.mkOverride 900 true;
          "ghc-bignum".components.library.planned = lib.mkOverride 900 true;
          "indexed-traversable".components.library.planned = lib.mkOverride 900 true;
          "ghc-lib-parser".components.library.planned = lib.mkOverride 900 true;
          "regex-posix".components.library.planned = lib.mkOverride 900 true;
          "base-compat-batteries".components.library.planned = lib.mkOverride 900 true;
          "contravariant".components.library.planned = lib.mkOverride 900 true;
          "extensible-exceptions".components.library.planned = lib.mkOverride 900 true;
          "syb".components.library.planned = lib.mkOverride 900 true;
          "text-short".components.library.planned = lib.mkOverride 900 true;
          "assoc".components.library.planned = lib.mkOverride 900 true;
          "process".components.library.planned = lib.mkOverride 900 true;
          "template-haskell".components.library.planned = lib.mkOverride 900 true;
          "stm".components.library.planned = lib.mkOverride 900 true;
          "witherable".components.library.planned = lib.mkOverride 900 true;
          "alex".components.exes."alex".planned = lib.mkOverride 900 true;
          "semialign".components.library.planned = lib.mkOverride 900 true;
          "QuickCheck".components.library.planned = lib.mkOverride 900 true;
          "ansi-wl-pprint".components.library.planned = lib.mkOverride 900 true;
          "uuid-types".components.library.planned = lib.mkOverride 900 true;
          "semigroupoids".components.library.planned = lib.mkOverride 900 true;
          "attoparsec".components.library.planned = lib.mkOverride 900 true;
          "uniplate".components.library.planned = lib.mkOverride 900 true;
          "mtl".components.library.planned = lib.mkOverride 900 true;
          "th-abstraction".components.library.planned = lib.mkOverride 900 true;
          "attoparsec".components.sublibs."attoparsec-internal".planned = lib.mkOverride 900 true;
          "transformers".components.library.planned = lib.mkOverride 900 true;
          "OneTuple".components.library.planned = lib.mkOverride 900 true;
          "parsec".components.library.planned = lib.mkOverride 900 true;
          "deepseq".components.library.planned = lib.mkOverride 900 true;
          "primitive".components.library.planned = lib.mkOverride 900 true;
          "old-locale".components.library.planned = lib.mkOverride 900 true;
          "text".components.library.planned = lib.mkOverride 900 true;
          "bifunctors".components.library.planned = lib.mkOverride 900 true;
          "ghc-lib-parser-ex".components.library.planned = lib.mkOverride 900 true;
          "unordered-containers".components.library.planned = lib.mkOverride 900 true;
          "random".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "integer-logarithms".components.library.planned = lib.mkOverride 900 true;
          "transformers-compat".components.library.planned = lib.mkOverride 900 true;
          "colour".components.library.planned = lib.mkOverride 900 true;
          "containers".components.library.planned = lib.mkOverride 900 true;
          "time-compat".components.library.planned = lib.mkOverride 900 true;
          "optparse-applicative".components.library.planned = lib.mkOverride 900 true;
          "aeson".components.library.planned = lib.mkOverride 900 true;
          "base-compat".components.library.planned = lib.mkOverride 900 true;
          "hostname".components.library.planned = lib.mkOverride 900 true;
          "hashable".components.library.planned = lib.mkOverride 900 true;
          "test-framework-hunit".components.library.planned = lib.mkOverride 900 true;
          "HsYAML".components.library.planned = lib.mkOverride 900 true;
          };
        })
    ];
  }