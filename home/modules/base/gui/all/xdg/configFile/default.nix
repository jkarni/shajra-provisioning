config: pkgs:

{
    "tridactyl/tridactylrc".source = builtins.toPath (pkgs.substituteAll {
        src = tridactyl/tridactylrc;
        theme_url  = config.theme.external.tridactyl.url;
        theme_name = config.theme.external.tridactyl.name;
    });
}
