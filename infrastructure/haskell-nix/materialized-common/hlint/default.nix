{
  pkgs = hackage:
    {
      packages = {
        "happy".revision = (((hackage."happy")."1.20.0").revisions).default;
        "filepattern".revision = (((hackage."filepattern")."0.1.2").revisions).default;
        "cpphs".revision = (((hackage."cpphs")."1.20.9.1").revisions).default;
        "cpphs".flags.old-locale = false;
        "ghc-boot-th".revision = (((hackage."ghc-boot-th")."8.10.7").revisions).default;
        "ghc-prim".revision = (((hackage."ghc-prim")."0.6.1").revisions).default;
        "distributive".revision = (((hackage."distributive")."0.6.2.1").revisions).default;
        "distributive".flags.tagged = true;
        "distributive".flags.semigroups = true;
        "pretty".revision = (((hackage."pretty")."1.1.3.6").revisions).default;
        "polyparse".revision = (((hackage."polyparse")."1.13").revisions).default;
        "indexed-traversable".revision = (((hackage."indexed-traversable")."0.1.2").revisions).default;
        "text-short".revision = (((hackage."text-short")."0.1.4").revisions).default;
        "text-short".flags.asserts = false;
        "integer-logarithms".revision = (((hackage."integer-logarithms")."1.0.3.1").revisions).default;
        "integer-logarithms".flags.check-bounds = false;
        "integer-logarithms".flags.integer-gmp = true;
        "text".revision = (((hackage."text")."1.2.4.1").revisions).default;
        "base".revision = (((hackage."base")."4.14.3.0").revisions).default;
        "time".revision = (((hackage."time")."1.9.3").revisions).default;
        "bifunctors".revision = (((hackage."bifunctors")."5.5.11").revisions).default;
        "bifunctors".flags.tagged = true;
        "bifunctors".flags.semigroups = true;
        "random".revision = (((hackage."random")."1.2.1").revisions).default;
        "dlist".revision = (((hackage."dlist")."1.0").revisions).default;
        "dlist".flags.werror = false;
        "unordered-containers".revision = (((hackage."unordered-containers")."0.2.16.0").revisions).default;
        "unordered-containers".flags.debug = false;
        "array".revision = (((hackage."array")."0.5.4.0").revisions).default;
        "ghc-lib-parser".revision = (((hackage."ghc-lib-parser")."9.0.1.20210324").revisions).default;
        "utf8-string".revision = (((hackage."utf8-string")."1.0.2").revisions).default;
        "process".revision = (((hackage."process")."1.6.13.2").revisions).default;
        "semigroupoids".revision = (((hackage."semigroupoids")."5.3.6").revisions).default;
        "semigroupoids".flags.distributive = true;
        "semigroupoids".flags.tagged = true;
        "semigroupoids".flags.containers = true;
        "semigroupoids".flags.contravariant = true;
        "semigroupoids".flags.unordered-containers = true;
        "semigroupoids".flags.comonad = true;
        "data-default-class".revision = (((hackage."data-default-class")."0.1.2.0").revisions).default;
        "th-abstraction".revision = (((hackage."th-abstraction")."0.4.3.0").revisions).default;
        "data-default-instances-containers".revision = (((hackage."data-default-instances-containers")."0.0.1").revisions).default;
        "conduit".revision = (((hackage."conduit")."1.3.4.2").revisions).default;
        "vector".revision = (((hackage."vector")."0.12.3.1").revisions).default;
        "vector".flags.unsafechecks = false;
        "vector".flags.internalchecks = false;
        "vector".flags.wall = false;
        "vector".flags.boundschecks = true;
        "hscolour".revision = (((hackage."hscolour")."1.24.4").revisions).default;
        "vector-algorithms".revision = (((hackage."vector-algorithms")."0.8.0.4").revisions).default;
        "vector-algorithms".flags.unsafechecks = false;
        "vector-algorithms".flags.internalchecks = false;
        "vector-algorithms".flags.bench = true;
        "vector-algorithms".flags.llvm = false;
        "vector-algorithms".flags.properties = true;
        "vector-algorithms".flags.boundschecks = true;
        "comonad".revision = (((hackage."comonad")."5.0.8").revisions).default;
        "comonad".flags.distributive = true;
        "comonad".flags.containers = true;
        "comonad".flags.indexed-traversable = true;
        "these".revision = (((hackage."these")."1.1.1.1").revisions).default;
        "these".flags.assoc = true;
        "split".revision = (((hackage."split")."0.2.3.4").revisions).default;
        "time-compat".revision = (((hackage."time-compat")."1.9.6.1").revisions).default;
        "time-compat".flags.old-locale = false;
        "contravariant".revision = (((hackage."contravariant")."1.5.5").revisions).default;
        "contravariant".flags.tagged = true;
        "contravariant".flags.semigroups = true;
        "contravariant".flags.statevar = true;
        "base-orphans".revision = (((hackage."base-orphans")."0.8.6").revisions).default;
        "extra".revision = (((hackage."extra")."1.7.10").revisions).default;
        "yaml".revision = (((hackage."yaml")."0.11.7.0").revisions).default;
        "yaml".flags.no-examples = true;
        "yaml".flags.no-exe = true;
        "base-compat".revision = (((hackage."base-compat")."0.12.1").revisions).default;
        "base-compat-batteries".revision = (((hackage."base-compat-batteries")."0.12.1").revisions).default;
        "assoc".revision = (((hackage."assoc")."1.0.2").revisions).default;
        "exceptions".revision = (((hackage."exceptions")."0.10.4").revisions).default;
        "data-fix".revision = (((hackage."data-fix")."0.3.2").revisions).default;
        "primitive".revision = (((hackage."primitive")."0.7.3.0").revisions).default;
        "hpc".revision = (((hackage."hpc")."0.6.1.0").revisions).default;
        "directory".revision = (((hackage."directory")."1.3.6.0").revisions).default;
        "clock".revision = (((hackage."clock")."0.8.2").revisions).default;
        "clock".flags.llvm = false;
        "ghc-lib-parser-ex".revision = (((hackage."ghc-lib-parser-ex")."9.0.0.4").revisions).default;
        "ghc-lib-parser-ex".flags.auto = true;
        "ghc-lib-parser-ex".flags.no-ghc-lib = false;
        "alex".revision = (((hackage."alex")."3.2.6").revisions).default;
        "alex".flags.small_base = true;
        "old-locale".revision = (((hackage."old-locale")."1.0.0.7").revisions).default;
        "mtl".revision = (((hackage."mtl")."2.2.2").revisions).default;
        "transformers".revision = (((hackage."transformers")."0.5.6.2").revisions).default;
        "rts".revision = (((hackage."rts")."1.0.1").revisions).default;
        "semialign".revision = (((hackage."semialign")."1.2.0.1").revisions).default;
        "semialign".flags.semigroupoids = true;
        "OneTuple".revision = (((hackage."OneTuple")."0.3.1").revisions).default;
        "template-haskell".revision = (((hackage."template-haskell")."2.16.0.0").revisions).default;
        "bytestring".revision = (((hackage."bytestring")."0.10.12.0").revisions).default;
        "aeson".revision = (((hackage."aeson")."2.0.2.0").revisions).default;
        "aeson".flags.cffi = false;
        "aeson".flags.bytestring-builder = false;
        "aeson".flags.ordered-keymap = true;
        "mono-traversable".revision = (((hackage."mono-traversable")."1.0.15.3").revisions).default;
        "witherable".revision = (((hackage."witherable")."0.4.2").revisions).default;
        "syb".revision = (((hackage."syb")."0.7.2.1").revisions).default;
        "strict".revision = (((hackage."strict")."0.4.0.1").revisions).default;
        "strict".flags.assoc = true;
        "data-default-instances-dlist".revision = (((hackage."data-default-instances-dlist")."0.0.1").revisions).default;
        "tagged".revision = (((hackage."tagged")."0.8.6.1").revisions).default;
        "tagged".flags.deepseq = true;
        "tagged".flags.transformers = true;
        "file-embed".revision = (((hackage."file-embed")."0.0.15.0").revisions).default;
        "deepseq".revision = (((hackage."deepseq")."1.4.4.0").revisions).default;
        "splitmix".revision = (((hackage."splitmix")."0.1.0.4").revisions).default;
        "splitmix".flags.optimised-mixer = false;
        "unix".revision = (((hackage."unix")."2.7.2.2").revisions).default;
        "attoparsec".revision = (((hackage."attoparsec")."0.14.3").revisions).default;
        "attoparsec".flags.developer = false;
        "uniplate".revision = (((hackage."uniplate")."1.6.13").revisions).default;
        "filepath".revision = (((hackage."filepath")."1.4.2.1").revisions).default;
        "ansi-terminal".revision = (((hackage."ansi-terminal")."0.11.1").revisions).default;
        "ansi-terminal".flags.example = false;
        "libyaml".revision = (((hackage."libyaml")."0.1.2").revisions).default;
        "libyaml".flags.no-unicode = false;
        "libyaml".flags.system-libyaml = false;
        "unliftio-core".revision = (((hackage."unliftio-core")."0.2.0.1").revisions).default;
        "stm".revision = (((hackage."stm")."2.5.0.1").revisions).default;
        "cmdargs".revision = (((hackage."cmdargs")."0.10.21").revisions).default;
        "cmdargs".flags.quotation = true;
        "cmdargs".flags.testprog = false;
        "integer-gmp".revision = (((hackage."integer-gmp")."1.0.3.0").revisions).default;
        "hashable".revision = (((hackage."hashable")."1.4.0.1").revisions).default;
        "hashable".flags.integer-gmp = true;
        "hashable".flags.containers = true;
        "hashable".flags.random-initial-seed = false;
        "transformers-compat".revision = (((hackage."transformers-compat")."0.7.1").revisions).default;
        "transformers-compat".flags.two = false;
        "transformers-compat".flags.mtl = true;
        "transformers-compat".flags.five-three = true;
        "transformers-compat".flags.three = false;
        "transformers-compat".flags.four = false;
        "transformers-compat".flags.five = false;
        "transformers-compat".flags.generic-deriving = true;
        "data-default-instances-old-locale".revision = (((hackage."data-default-instances-old-locale")."0.0.1").revisions).default;
        "indexed-traversable-instances".revision = (((hackage."indexed-traversable-instances")."0.1.1").revisions).default;
        "scientific".revision = (((hackage."scientific")."0.3.7.0").revisions).default;
        "scientific".flags.bytestring-builder = false;
        "scientific".flags.integer-simple = false;
        "refact".revision = (((hackage."refact")."0.3.0.2").revisions).default;
        "resourcet".revision = (((hackage."resourcet")."1.2.4.3").revisions).default;
        "binary".revision = (((hackage."binary")."0.8.8.0").revisions).default;
        "uuid-types".revision = (((hackage."uuid-types")."1.0.5").revisions).default;
        "containers".revision = (((hackage."containers")."0.6.5.1").revisions).default;
        "data-default".revision = (((hackage."data-default")."0.7.1.1").revisions).default;
        "colour".revision = (((hackage."colour")."2.3.6").revisions).default;
        "StateVar".revision = (((hackage."StateVar")."1.2.2").revisions).default;
        };
      compiler = {
        version = "8.10.7";
        nix-name = "ghc8107";
        packages = {
          "ghc-boot-th" = "8.10.7";
          "ghc-prim" = "0.6.1";
          "pretty" = "1.1.3.6";
          "text" = "1.2.4.1";
          "base" = "4.14.3.0";
          "time" = "1.9.3";
          "array" = "0.5.4.0";
          "process" = "1.6.13.2";
          "exceptions" = "0.10.4";
          "hpc" = "0.6.1.0";
          "directory" = "1.3.6.0";
          "mtl" = "2.2.2";
          "transformers" = "0.5.6.2";
          "rts" = "1.0.1";
          "template-haskell" = "2.16.0.0";
          "bytestring" = "0.10.12.0";
          "deepseq" = "1.4.4.0";
          "unix" = "2.7.2.2";
          "filepath" = "1.4.2.1";
          "stm" = "2.5.0.1";
          "integer-gmp" = "1.0.3.0";
          "binary" = "0.8.8.0";
          "containers" = "0.6.5.1";
          };
        };
      };
  extras = hackage:
    { packages = { hlint = ./.plan.nix/hlint.nix; }; };
  modules = [
    ({ lib, ... }:
      {
        packages = {
          "hlint" = {
            flags = {
              "hsyaml" = lib.mkOverride 900 false;
              "threaded" = lib.mkOverride 900 true;
              "ghc-lib" = lib.mkOverride 900 false;
              "gpl" = lib.mkOverride 900 true;
              };
            };
          };
        })
    ({ lib, ... }:
      {
        packages = {
          "vector-algorithms".components.library.planned = lib.mkOverride 900 true;
          "data-default-instances-containers".components.library.planned = lib.mkOverride 900 true;
          "base-orphans".components.library.planned = lib.mkOverride 900 true;
          "yaml".components.library.planned = lib.mkOverride 900 true;
          "unliftio-core".components.library.planned = lib.mkOverride 900 true;
          "ansi-terminal".components.library.planned = lib.mkOverride 900 true;
          "indexed-traversable".components.library.planned = lib.mkOverride 900 true;
          "ghc-lib-parser".components.library.planned = lib.mkOverride 900 true;
          "hlint".components.library.planned = lib.mkOverride 900 true;
          "these".components.library.planned = lib.mkOverride 900 true;
          "filepath".components.library.planned = lib.mkOverride 900 true;
          "contravariant".components.library.planned = lib.mkOverride 900 true;
          "extra".components.library.planned = lib.mkOverride 900 true;
          "resourcet".components.library.planned = lib.mkOverride 900 true;
          "data-default-instances-old-locale".components.library.planned = lib.mkOverride 900 true;
          "split".components.library.planned = lib.mkOverride 900 true;
          "base-compat-batteries".components.library.planned = lib.mkOverride 900 true;
          "syb".components.library.planned = lib.mkOverride 900 true;
          "pretty".components.library.planned = lib.mkOverride 900 true;
          "utf8-string".components.library.planned = lib.mkOverride 900 true;
          "text-short".components.library.planned = lib.mkOverride 900 true;
          "assoc".components.library.planned = lib.mkOverride 900 true;
          "process".components.library.planned = lib.mkOverride 900 true;
          "distributive".components.library.planned = lib.mkOverride 900 true;
          "mono-traversable".components.library.planned = lib.mkOverride 900 true;
          "libyaml".components.library.planned = lib.mkOverride 900 true;
          "bytestring".components.library.planned = lib.mkOverride 900 true;
          "clock".components.library.planned = lib.mkOverride 900 true;
          "template-haskell".components.library.planned = lib.mkOverride 900 true;
          "witherable".components.library.planned = lib.mkOverride 900 true;
          "stm".components.library.planned = lib.mkOverride 900 true;
          "strict".components.library.planned = lib.mkOverride 900 true;
          "comonad".components.library.planned = lib.mkOverride 900 true;
          "data-fix".components.library.planned = lib.mkOverride 900 true;
          "exceptions".components.library.planned = lib.mkOverride 900 true;
          "alex".components.exes."alex".planned = lib.mkOverride 900 true;
          "hscolour".components.exes."HsColour".planned = lib.mkOverride 900 true;
          "semialign".components.library.planned = lib.mkOverride 900 true;
          "dlist".components.library.planned = lib.mkOverride 900 true;
          "ghc-prim".components.library.planned = lib.mkOverride 900 true;
          "hpc".components.library.planned = lib.mkOverride 900 true;
          "array".components.library.planned = lib.mkOverride 900 true;
          "scientific".components.library.planned = lib.mkOverride 900 true;
          "semigroupoids".components.library.planned = lib.mkOverride 900 true;
          "binary".components.library.planned = lib.mkOverride 900 true;
          "filepattern".components.library.planned = lib.mkOverride 900 true;
          "refact".components.library.planned = lib.mkOverride 900 true;
          "ghc-boot-th".components.library.planned = lib.mkOverride 900 true;
          "uuid-types".components.library.planned = lib.mkOverride 900 true;
          "file-embed".components.library.planned = lib.mkOverride 900 true;
          "tagged".components.library.planned = lib.mkOverride 900 true;
          "splitmix".components.library.planned = lib.mkOverride 900 true;
          "mtl".components.library.planned = lib.mkOverride 900 true;
          "uniplate".components.library.planned = lib.mkOverride 900 true;
          "rts".components.library.planned = lib.mkOverride 900 true;
          "attoparsec".components.library.planned = lib.mkOverride 900 true;
          "unix".components.library.planned = lib.mkOverride 900 true;
          "data-default-instances-dlist".components.library.planned = lib.mkOverride 900 true;
          "indexed-traversable-instances".components.library.planned = lib.mkOverride 900 true;
          "data-default-class".components.library.planned = lib.mkOverride 900 true;
          "th-abstraction".components.library.planned = lib.mkOverride 900 true;
          "hscolour".components.library.planned = lib.mkOverride 900 true;
          "vector".components.library.planned = lib.mkOverride 900 true;
          "hlint".components.exes."hlint".planned = lib.mkOverride 900 true;
          "transformers".components.library.planned = lib.mkOverride 900 true;
          "deepseq".components.library.planned = lib.mkOverride 900 true;
          "OneTuple".components.library.planned = lib.mkOverride 900 true;
          "directory".components.library.planned = lib.mkOverride 900 true;
          "primitive".components.library.planned = lib.mkOverride 900 true;
          "happy".components.exes."happy".planned = lib.mkOverride 900 true;
          "cpphs".components.exes."cpphs".planned = lib.mkOverride 900 true;
          "old-locale".components.library.planned = lib.mkOverride 900 true;
          "bifunctors".components.library.planned = lib.mkOverride 900 true;
          "ghc-lib-parser-ex".components.library.planned = lib.mkOverride 900 true;
          "conduit".components.library.planned = lib.mkOverride 900 true;
          "unordered-containers".components.library.planned = lib.mkOverride 900 true;
          "random".components.library.planned = lib.mkOverride 900 true;
          "text".components.library.planned = lib.mkOverride 900 true;
          "base".components.library.planned = lib.mkOverride 900 true;
          "cpphs".components.library.planned = lib.mkOverride 900 true;
          "time".components.library.planned = lib.mkOverride 900 true;
          "integer-logarithms".components.library.planned = lib.mkOverride 900 true;
          "data-default".components.library.planned = lib.mkOverride 900 true;
          "transformers-compat".components.library.planned = lib.mkOverride 900 true;
          "integer-gmp".components.library.planned = lib.mkOverride 900 true;
          "cmdargs".components.library.planned = lib.mkOverride 900 true;
          "StateVar".components.library.planned = lib.mkOverride 900 true;
          "colour".components.library.planned = lib.mkOverride 900 true;
          "polyparse".components.library.planned = lib.mkOverride 900 true;
          "containers".components.library.planned = lib.mkOverride 900 true;
          "aeson".components.library.planned = lib.mkOverride 900 true;
          "base-compat".components.library.planned = lib.mkOverride 900 true;
          "time-compat".components.library.planned = lib.mkOverride 900 true;
          "hashable".components.library.planned = lib.mkOverride 900 true;
          };
        })
    ];
  }