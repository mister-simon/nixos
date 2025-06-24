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

    # PHP
    php84
    php84Packages.composer
    php84Extensions.ctype
    php84Extensions.curl
    php84Extensions.dom
    php84Extensions.fileinfo
    php84Extensions.filter
    php84Extensions.mbstring
    php84Extensions.openssl
    php84Extensions.pdo
    php84Extensions.session
    php84Extensions.tokenizer
    php84Extensions.xml
  ];

  programs.zsh.enable = true;
}
