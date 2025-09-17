{ inputs, ... }:
{
  imports = [
    # Hardware
    ./hardware.nix

    # Software
    ./host-packages.nix
    ./shell-aliases.nix
  ];

  # Bootloader
  boot.initrd.luks.devices."luks-cef16352-8b6c-4c9a-bc40-c077a1cc2ccb".device =
    "/dev/disk/by-uuid/cef16352-8b6c-4c9a-bc40-c077a1cc2ccb";
}
