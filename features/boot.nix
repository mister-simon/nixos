{ ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.consoleMode = "max";

  boot.loader.efi.canTouchEfiVariables = true;

  boot.supportedFilesystems = [
    "ntfs"
    "exfat"
    "vfat"
    "btrfs"
    "reiserfs"
    "f2fs"
    "xfs"
    "cifs"
  ];
}
