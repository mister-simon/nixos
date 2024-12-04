{ config, pkgs, ... }:

{
  imports = [
    # Global
    ./hardware-configuration.nix

    # User
    ../../users/simon/system.nix

    # General
    ../../features/boot.nix
    ../../features/networking.nix
    ../../features/i18n.nix
    ../../features/nix.nix
    ../../features/gnome.nix
    ../../features/printing.nix
    ../../features/sound.nix
    ../../features/fonts.nix

    # Programs
    ../../features/programs-browsers.nix
    ../../features/programs-cli.nix
    ../../features/programs-php.nix
    ../../features/programs-editor.nix
    ../../features/programs-virtualbox.nix
    ../../features/programs-chat.nix

    # Other laptop stuff
    ./fingerprint-reader.nix
    ./xremap.nix
  ];

  # TODO:
  # nh cleaner
  # Autologin?
  # Networking hosts
  # Gnome exclusions
  # Gnome packages
  # nix-ld
  # Flatpak
  # home-manager things and stuff

  # Bootloader.
  boot.initrd.luks.devices."luks-cef16352-8b6c-4c9a-bc40-c077a1cc2ccb".device = "/dev/disk/by-uuid/cef16352-8b6c-4c9a-bc40-c077a1cc2ccb";

  system.stateVersion = "24.11"; # Did you read the comment?
}
