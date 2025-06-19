{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    discord
    google-chrome
    gnome-software
    inkscape
    krita
    nodejs
    nodejs.pkgs.pnpm
    protonmail-desktop
    protonvpn-gui
    tldr
    vscode
  ];

  programs.zsh.enable = true;
}
