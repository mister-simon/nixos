{ pkgs, ... }:
{
  home = {
    username = "simon";
    homeDirectory = "/home/simon";

    stateVersion = "24.05";

    packages = [ ];
    file = { };
    sessionVariables = { };
  };

  programs = {
    git = {
      enable = true;
      userName = "Simon W";
      userEmail = "4751279+mister-simon@users.noreply.github.com";
    };

    home-manager.enable = true;

    bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        nrs = "home-manager switch --flake ~/nixos";
        update-hosts = "nix flake update --flake ~/nixos localhosts && nrs";
      };
      initExtra = ''
        git_prompt="${pkgs.git}/share/bash-completion/completions/git-prompt.sh"
        fnm_bin="${pkgs.fnm}/bin/fnm"
        ${builtins.readFile ../leafsprite/sources/.bashrc}
        unset git_prompt fnm_bin
      '';
    };
  };

}
