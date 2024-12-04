{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../users/simon.nix
    ../../features/boot.nix
    ../../features/networking.nix
    ../../features/i18n.nix
    ../../features/nix.nix
    ../../features/gnome.nix
    ../../features/printing.nix
    ../../features/sound.nix
    ../../features/programs-browsers.nix
    ../../features/programs-cli.nix
    ../../features/programs-editor.nix
  ];

  # Bootloader.
  boot.initrd.luks.devices."luks-cef16352-8b6c-4c9a-bc40-c077a1cc2ccb".device = "/dev/disk/by-uuid/cef16352-8b6c-4c9a-bc40-c077a1cc2ccb";

  system.stateVersion = "24.11"; # Did you read the comment?
}
