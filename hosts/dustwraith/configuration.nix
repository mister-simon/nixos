{ config, pkgs, ... }:

{
  imports = [
    # Global
    ./hardware-configuration.nix

    # User
    ../../users/simon.nix

    # General
    ../../features/boot.nix
    ../../features/networking.nix
    ../../features/i18n.nix
    ../../features/nix.nix
    ../../features/gnome.nix
    ../../features/printing.nix
    ../../features/sound.nix

    # Programs
    ../../features/programs-browsers.nix
    ../../features/programs-cli.nix
    ../../features/programs-php.nix
    ../../features/programs-editor.nix
    ../../features/programs-virtualbox.nix

    # Other laptop stuff
    ./fingerprint-reader.nix
  ];

  # Bootloader.
  boot.initrd.luks.devices."luks-cef16352-8b6c-4c9a-bc40-c077a1cc2ccb".device = "/dev/disk/by-uuid/cef16352-8b6c-4c9a-bc40-c077a1cc2ccb";

  system.stateVersion = "24.11"; # Did you read the comment?
}
