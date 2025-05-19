{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # audacity
    # discord
    nodejs
    # obs-studio
    firefox
    tldr
    gnome-software
    vscode
    protonmail-desktop
    protonvpn-gui
  ];
}
