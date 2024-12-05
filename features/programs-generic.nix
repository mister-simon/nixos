{ pkgs, ... }:
{
  # Enable generic linked binaries (nodejs managed with fnm, etc)
  programs.nix-ld.enable = true;
}
