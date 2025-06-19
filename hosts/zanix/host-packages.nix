{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    nodejs
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
