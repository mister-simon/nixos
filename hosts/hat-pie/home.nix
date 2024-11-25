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
        fnm
        bat
        fd
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
  };
}
