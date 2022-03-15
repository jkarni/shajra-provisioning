{
    enable = true;
    cleanup = "zap";
    global = {
        brewfile = true;
        noLock = true;
    };

    taps =  [
        "homebrew/bundle"
        "homebrew/cask"
        "homebrew/cask-drivers"
        "homebrew/cask-fonts"
        "homebrew/cask-versions"
        "homebrew/core"
        "homebrew/services"
        "koekeishiya/formulae"
    ];

    brews = [
        #"kubernetes-cli"
        "svn"  # DESIGN: needed for Source Code Pro
    ];

    casks = [
        #"chromium"
        #"docker"
        "discord"
        "firefox"
        "font-awesome-terminal-fonts"
        "font-fontawesome"
        "font-source-code-pro"
        "google-chrome-beta"
        "iterm2"
        "karabiner-elements"
        #"kensington-trackball-works"  # DESIGN: broken for M1
        #"openvpn-connect"
        "slack"
        #"virtualbox"
        #"virtualbox-extension-pack"
        "wireshark"
        "zoom"
    ];

    extraConfig = ''
        brew "koekeishiya/formulae/yabai", args: ["HEAD"], restart_service: :changed
        brew "koekeishiya/formulae/skhd", args: ["HEAD"], restart_service: :changed
    '';
}
