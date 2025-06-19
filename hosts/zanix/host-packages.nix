{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    nodejs
    nodejs.pkgs.pnpm
    tldr
    gnome-software
    vscode
    protonmail-desktop
    protonvpn-gui
    google-chrome
    krita
    inkscape
  ];
}
