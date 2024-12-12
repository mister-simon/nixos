{ ... }:
{
  imports = [
    ../../users/simon/home/home.nix # Home manager basics
    ../../users/simon/home/gnome.nix # Mostly dconf
    ../../users/simon/home/cli.nix # Some additional CLI tool config
    ../../users/simon/home/bash.nix # Bashrc, aliases, etc.
    # ../../users/simon/home/flatpak.nix # Additional user config for flatpaks
  ];

  # Local tweaks
  dconf = {
    settings = {
      "org/gnome/desktop/screensaver" = {
        picture-options = "zoomed";
      };

      "org/gnome/desktop/background" = {
        picture-options = "zoomed";
      };
    };
  };
}
