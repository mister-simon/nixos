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
      # tldr # Tealdeer added
      clock-rs
      webcamoid
      vorta
      localsend

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
      protonmail-desktop
      protonvpn-gui
      obs-studio
      inkscape
      krita
      vscode
      obsidian

      nodejs
      nodejs.pkgs.pnpm
    ]);

  programs.zsh.enable = true;
}
