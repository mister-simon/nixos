{ pkgs, ... }:
{
  # Home
  home = {
    username = "simon";
    homeDirectory = "/home/simon";

    stateVersion = "24.05";

    packages = (
      with pkgs;
      [
        # CLI
        bat
        curl
        gh
        git
        fd
        fnm
        fzf
        tldr
        wget
        zip

        # PHP
        # php84
        # php84Packages.composer
        # php84Extensions.ctype
        # php84Extensions.curl
        # php84Extensions.dom
        # php84Extensions.fileinfo
        # php84Extensions.filter
        # # php84Extensions.hash # Couldn't find this one in package search...
        # php84Extensions.mbstring
        # php84Extensions.openssl
        # # php84Extensions.pcre # Couldn't find this one either...
        # php84Extensions.pdo
        # php84Extensions.session
        # php84Extensions.tokenizer
        # php84Extensions.xml

        # Nix
        nixfmt-rfc-style
        nixd

        # Fonts
        (nerdfonts.override {
          fonts = [
            "FiraCode"
            "JetBrainsMono"
            "Mononoki"
            "Monaspace"
          ];
        })
      ]
    );

    file = {
      ".bash_aliases".source = ../leafsprite/sources/.bash_aliases;
    };
    sessionVariables = { };

    shellAliases = {
      nrs = "home-manager switch --flake ~/nixos";
      update-hosts = "nix flake update --flake ~/nixos localhosts && nrs";
    };
  };

  # Fonts
  fonts.fontconfig = {
    enable = true;
    defaultFonts.monospace = [
      "MonaspiceRn Nerd Font"
      "FiraCode Nerd Font"
    ];
  };

  # Programs
  programs = {
    home-manager.enable = true;

    git = {
      enable = true;
      userName = "Simon W";
      userEmail = "4751279+mister-simon@users.noreply.github.com";
    };

    bash = {
      enable = true;
      enableCompletion = true;
      initExtra = ''
        git_prompt="${pkgs.git}/share/bash-completion/completions/git-prompt.sh"
        fnm_bin="${pkgs.fnm}/bin/fnm"
        ${builtins.readFile ../leafsprite/sources/.bashrc}
        unset git_prompt fnm_bin
      '';
    };

    kitty = {
      enable = true;
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      options = [ "--cmd cd" ];
    };

    fzf = {
      enable = true;
      enableBashIntegration = true;

      defaultOptions = [
        "--preview='bat --color=always -n {}'"
        "--bind 'ctrl-/:toggle-preview'"
      ];
      defaultCommand = "fd --type f --exclude .git --follow --hidden";
      changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
    };

    neovim = {
      enable = true;
      vimAlias = true;
      plugins = with pkgs.vimPlugins; [
        vim-sensible
        nerdtree
      ];
    };

    vscode.enable = true;
  };

  # Dconf
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/background" = {
        picture-options = "zoom";
        picture-uri = "file://${../leafsprite/sources/leafsprite-wide-bg.png}";
        picture-uri-dark = "file://${../leafsprite/sources/leafsprite-wide-bg.png}";
      };
      "org/gnome/desktop/screensaver" = {
        picture-options = "zoom";
        picture-uri = "file://${../leafsprite/sources/leafsprite-wide-bg.png}";
        picture-uri-dark = "file://${../leafsprite/sources/leafsprite-wide-bg.png}";
      };
    };
  };
}
