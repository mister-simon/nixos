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

  system.stateVersion = "24.05";
}
