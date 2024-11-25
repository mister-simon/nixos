{
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Simon W";
    userEmail = "4751279+mister-simon@users.noreply.github.com";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    defaultOptions = [
      "--preview='bat --color=always -n {}'"
      "--bind 'ctrl-/:toggle-preview'"
    ];
    defaultCommand = "fd --type f --exclude .git --follow --hidden";
    changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
  };

  programs.vscode = {
    enable = true;
    # Manage extensions with vscode sync 🤷
  };

  home.file.".bash_aliases".source = ../leafsprite/sources/.bash_aliases;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/#leafsprite";
      update-hosts = "nix flake update --flake ~/nixos localhosts && nrs";
    };
    initExtra = ''
      git_prompt="${pkgs.git}/share/bash-completion/completions/git-prompt.sh"
      fnm_bin="${pkgs.fnm}/bin/fnm"
      ${builtins.readFile ../leafsprite/sources/.bashrc}
      unset git_prompt fnm_bin
    '';
  };
}
