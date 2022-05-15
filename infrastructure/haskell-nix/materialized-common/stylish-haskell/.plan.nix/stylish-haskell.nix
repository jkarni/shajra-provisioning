{ system
  , compiler
  , flags
  , pkgs
  , hsPkgs
  , pkgconfPkgs
  , errorHandler
  , config
  , ... }:
  {
    flags = { ghc-lib = false; };
    package = {
      specVersion = "2.4";
      identifier = { name = "stylish-haskell"; version = "0.14.2.0"; };
      license = "BSD-3-Clause";
      copyright = "2012 Jasper Van der Jeugt";
      maintainer = "Jasper Van der Jeugt <m@jaspervdj.be>";
      author = "Jasper Van der Jeugt <m@jaspervdj.be>";
      homepage = "https://github.com/haskell/stylish-haskell";
      url = "";
      synopsis = "Haskell code prettifier";
      description = "A Haskell code prettifier. For more information, see:\n\n<https://github.com/haskell/stylish-haskell/blob/master/README.markdown>";
      buildType = "Simple";
      isLocal = true;
      detailLevel = "FullDetails";
      licenseFiles = [ "LICENSE" ];
      dataDir = ".";
      dataFiles = [];
      extraSrcFiles = [
        "CHANGELOG"
        "README.markdown"
        "data/stylish-haskell.yaml"
        ];
      extraTmpFiles = [];
      extraDocFiles = [];
      };
    components = {
      "library" = {
        depends = ([
          (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
          (hsPkgs."base" or (errorHandler.buildDepError "base"))
          (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
          (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
          (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
          (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
          (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
          (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
          (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
          (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
          (hsPkgs."text" or (errorHandler.buildDepError "text"))
          (hsPkgs."HsYAML-aeson" or (errorHandler.buildDepError "HsYAML-aeson"))
          (hsPkgs."HsYAML" or (errorHandler.buildDepError "HsYAML"))
          (hsPkgs."ghc-lib-parser-ex" or (errorHandler.buildDepError "ghc-lib-parser-ex"))
          ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0") (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))) ++ (if compiler.isGhc && (compiler.version).ge "9.2.2" && !flags.ghc-lib
          then [
            (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
            (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
            (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
            ]
          else [
            (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
            ]);
        buildable = true;
        modules = [
          "Language/Haskell/Stylish/Align"
          "Language/Haskell/Stylish/Block"
          "Language/Haskell/Stylish/Comments"
          "Language/Haskell/Stylish/Config/Cabal"
          "Language/Haskell/Stylish/Config/Internal"
          "Language/Haskell/Stylish/Editor"
          "Language/Haskell/Stylish/Ordering"
          "Language/Haskell/Stylish/Util"
          "Language/Haskell/Stylish/Verbose"
          "Paths_stylish_haskell"
          "Language/Haskell/Stylish"
          "Language/Haskell/Stylish/Config"
          "Language/Haskell/Stylish/GHC"
          "Language/Haskell/Stylish/Module"
          "Language/Haskell/Stylish/Parse"
          "Language/Haskell/Stylish/Printer"
          "Language/Haskell/Stylish/Step"
          "Language/Haskell/Stylish/Step/Data"
          "Language/Haskell/Stylish/Step/Imports"
          "Language/Haskell/Stylish/Step/LanguagePragmas"
          "Language/Haskell/Stylish/Step/ModuleHeader"
          "Language/Haskell/Stylish/Step/SimpleAlign"
          "Language/Haskell/Stylish/Step/Squash"
          "Language/Haskell/Stylish/Step/Tabs"
          "Language/Haskell/Stylish/Step/TrailingWhitespace"
          "Language/Haskell/Stylish/Step/UnicodeSyntax"
          ];
        hsSourceDirs = [ "lib" ];
        };
      exes = {
        "stylish-haskell" = {
          depends = ([
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."HsYAML-aeson" or (errorHandler.buildDepError "HsYAML-aeson"))
            (hsPkgs."HsYAML" or (errorHandler.buildDepError "HsYAML"))
            (hsPkgs."ghc-lib-parser-ex" or (errorHandler.buildDepError "ghc-lib-parser-ex"))
            (hsPkgs."stylish-haskell" or (errorHandler.buildDepError "stylish-haskell"))
            (hsPkgs."strict" or (errorHandler.buildDepError "strict"))
            (hsPkgs."optparse-applicative" or (errorHandler.buildDepError "optparse-applicative"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0") (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))) ++ (if compiler.isGhc && (compiler.version).ge "9.2.2" && !flags.ghc-lib
            then [
              (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
              (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
              (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
              ]
            else [
              (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
              ]);
          buildable = true;
          hsSourceDirs = [ "src" ];
          mainPath = ([
            "Main.hs"
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0") "") ++ [
            ""
            ];
          };
        };
      tests = {
        "stylish-haskell-tests" = {
          depends = ([
            (hsPkgs."aeson" or (errorHandler.buildDepError "aeson"))
            (hsPkgs."base" or (errorHandler.buildDepError "base"))
            (hsPkgs."bytestring" or (errorHandler.buildDepError "bytestring"))
            (hsPkgs."Cabal" or (errorHandler.buildDepError "Cabal"))
            (hsPkgs."containers" or (errorHandler.buildDepError "containers"))
            (hsPkgs."directory" or (errorHandler.buildDepError "directory"))
            (hsPkgs."filepath" or (errorHandler.buildDepError "filepath"))
            (hsPkgs."file-embed" or (errorHandler.buildDepError "file-embed"))
            (hsPkgs."mtl" or (errorHandler.buildDepError "mtl"))
            (hsPkgs."syb" or (errorHandler.buildDepError "syb"))
            (hsPkgs."text" or (errorHandler.buildDepError "text"))
            (hsPkgs."HsYAML-aeson" or (errorHandler.buildDepError "HsYAML-aeson"))
            (hsPkgs."HsYAML" or (errorHandler.buildDepError "HsYAML"))
            (hsPkgs."ghc-lib-parser-ex" or (errorHandler.buildDepError "ghc-lib-parser-ex"))
            (hsPkgs."stylish-haskell" or (errorHandler.buildDepError "stylish-haskell"))
            (hsPkgs."HUnit" or (errorHandler.buildDepError "HUnit"))
            (hsPkgs."random" or (errorHandler.buildDepError "random"))
            (hsPkgs."test-framework" or (errorHandler.buildDepError "test-framework"))
            (hsPkgs."test-framework-hunit" or (errorHandler.buildDepError "test-framework-hunit"))
            ] ++ (pkgs.lib).optional (compiler.isGhc && (compiler.version).lt "8.0") (hsPkgs."semigroups" or (errorHandler.buildDepError "semigroups"))) ++ (if compiler.isGhc && (compiler.version).ge "9.2.2" && !flags.ghc-lib
            then [
              (hsPkgs."ghc" or (errorHandler.buildDepError "ghc"))
              (hsPkgs."ghc-boot" or (errorHandler.buildDepError "ghc-boot"))
              (hsPkgs."ghc-boot-th" or (errorHandler.buildDepError "ghc-boot-th"))
              ]
            else [
              (hsPkgs."ghc-lib-parser" or (errorHandler.buildDepError "ghc-lib-parser"))
              ]);
          buildable = true;
          modules = [
            "Language/Haskell/Stylish/Config/Tests"
            "Language/Haskell/Stylish/Parse/Tests"
            "Language/Haskell/Stylish/Regressions"
            "Language/Haskell/Stylish/Step/Data/Tests"
            "Language/Haskell/Stylish/Step/Imports/FelixTests"
            "Language/Haskell/Stylish/Step/Imports/Tests"
            "Language/Haskell/Stylish/Step/LanguagePragmas/Tests"
            "Language/Haskell/Stylish/Step/ModuleHeader/Tests"
            "Language/Haskell/Stylish/Step/SimpleAlign/Tests"
            "Language/Haskell/Stylish/Step/Squash/Tests"
            "Language/Haskell/Stylish/Step/Tabs/Tests"
            "Language/Haskell/Stylish/Step/TrailingWhitespace/Tests"
            "Language/Haskell/Stylish/Step/UnicodeSyntax/Tests"
            "Language/Haskell/Stylish/Tests"
            "Language/Haskell/Stylish/Tests/Util"
            ];
          hsSourceDirs = [ "tests" ];
          mainPath = [ "TestSuite.hs" ];
          };
        };
      };
    } // rec { src = (pkgs.lib).mkDefault ../.; }