{ inputs, pkgs, ... }:
{
  imports = [
    ./boot.nix
    ./flatpak.nix
    ./fonts.nix
    # ./greetd.nix
    # ./sddm.nix
    ./hardware.nix
    ./network.nix
    ./nfs.nix
    ./nh.nix
    ./packages.nix
    ./printing.nix
    ./security.nix
    ./services.nix
    ./starfish.nix
    ./steam.nix
    ./stylix.nix
    ./syncthing.nix
    ./system.nix
    ./thunar.nix
    ./user.nix
    # ./virtualisation-docker.nix
    ./virtualisation-virtualbox.nix
    ./xserver.nix
    inputs.stylix.nixosModules.stylix
  ];

  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Enable xwayland compat
  services.desktopManager.cosmic.xwayland.enable = true;
}
