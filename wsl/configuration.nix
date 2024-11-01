{
  pkgs,
  pkgs-stable,
  localhosts,
  lib,
  ...
}:
{
  wsl.enable = true;

  nix.settings = {
    auto-optimise-store = true;

    min-free = 128000000;
    max-free = 1000000000;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    warn-dirty = false;
  };

  programs.nix-ld.enable = true;

  environment.systemPackages = with pkgs; [
    # CLI
    git
    gh
    vim
    wget
    curl
    bat
    fnm
    zip
    tldr
    fzf
    fd
  ];

  system.stateVersion = "24.05";
}
