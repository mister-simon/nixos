{
  pkgs,
  pkgs-unstable,
  ...
}:
{
  environment.systemPackages =
    (with pkgs; [
      discord
      google-chrome
      gnome-software
      nodejs
      nodejs.pkgs.pnpm
      # tldr # Tealdeer added
      clock-rs
      dbeaver-bin

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
    ])
    ++ (with pkgs-unstable; [
      proton-pass
      protonmail-desktop
      protonvpn-gui
      obs-studio
      inkscape
      krita
      vscode
      obsidian
      devenv
      onlyoffice-desktopeditors
      vial
      heroku
      caddy
    ]);

  programs.zsh.enable = true;
}
