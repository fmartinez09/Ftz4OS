{pkgs, inputs, ...}:
rec {
    system = "x86_64-linux";
    hostname = "ftz-laptop"; # Hostname
    username = "fernando"; # Username
    profile = "laptop"; # Select from profiles directory
    timezone = "Europe/Moscow"; # Select timezone
    locale = "es_CL.UTF-8"; # Select locale
    name = "Fernando Martinez"; # Name (git config)
    email = "2keep2mind@gmail.com"; # Email (git config)
    dotfilesDir = "/home/${username}/.dotfiles"; # Absolute path of the repo;

    theme = "catppuccin"; # Selected theme from themes directory (./themes/)
    themeDetails = import (./. + "/themes/${theme}.nix") {inherit pkgs;};

    shell = "zsh"; # See user/shells directory.
    shellPkg = pkgs.zsh;

    wms = ["hyprland"]; # See user/wm/ and system/wm directories.
    editors = ["neovim"]; # See user/editors directory.
    browsers = ["zen-browser"]; # See user/browsers directory.
    preferredEditor = "nvim"; # Session variable $TERM.
    preferredBrowser = "zen"; # Session variable $BROWSER.
}
