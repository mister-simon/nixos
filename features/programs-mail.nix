{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    protonmail-desktop
  ];

  services.flatpak.packages = [
    "eu.betterbird.Betterbird"
  ];
}
