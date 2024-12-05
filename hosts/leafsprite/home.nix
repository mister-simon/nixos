{
  ...
}:

{
  imports = [
    ../../users/simon/home/home.nix # Home manager basics
    ../../users/simon/home/gnome.nix # Mostly dconf
    ../../users/simon/home/cli.nix # Some additional CLI tool config
    ../../users/simon/home/bash.nix # Bashrc, aliases, etc.
    ../../users/simon/home/zsh.nix # Zsh setup
    ../../users/simon/home/flatpak.nix # Additional user config for flatpaks
  ];

  home.sessionVariables.SHELL = "zsh";
}
