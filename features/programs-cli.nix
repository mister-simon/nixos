{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    prompt.enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Simon W";
        email = "4751279+mister-simon@users.noreply.github.com";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    bat
    fnm
    zip
    tldr
    fzf
    fd
  ];

  environment.shellAliases = {
    # Nix
    nrb = "sudo nixos-rebuild boot --flake ~/nixos/#$HOSTNAME";
    nrs = "sudo nixos-rebuild switch --flake ~/nixos/#$HOSTNAME";

    # Git
    gs = "git status";
    gd = "git diff";
    gc = "git commit -m";
    gam = "git commit --amend --no-edit";
    game = "git commit --amend";
    gaa = "git add -A";
    ga = "git add .";
    gp = "git push";

    # Vagrant / Sail
    vu = "vagrant up --provision";
    vh = "vagrant halt";
    vr = "vagrant reload --provision";
    vssh = "vagrant ssh";
    sail = "sh $([ -f sail ] && echo sail || echo vendor/bin/sail)";

    # Zellij
    zj = ''zellij a --create ''${PWD///}'';
  };
}
