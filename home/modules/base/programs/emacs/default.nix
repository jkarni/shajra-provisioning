pkgs:

{
    enable = true;

    package = pkgs.emacsGit;

    extraPackages = epkgs: with epkgs; [
        emacsql
        emacsql-sqlite
        vterm
    ];
}
