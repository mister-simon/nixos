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

  # Clean yoself
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 20d --keep 20";
    flake = "/nixos/nixos";
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

  xdg.portal = {
    enable = true;
    config.common.default = [ "gtk" ];
  };

  system.stateVersion = "24.05";
}
