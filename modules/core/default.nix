{ inputs, pkgs, ... }:
{
  imports = [
    ./boot.nix
    # ./cosmic.nix
    ./fingerprint-reader.nix
    ./flatpak.nix
    ./fonts.nix
    # ./greetd.nix
    ./gnome.nix
    ./gnome-autologin.nix
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
}
