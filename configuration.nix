# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [
    "btrfs"
    "ext2"
    "ext3"
    "ext4"
    "exfat"
    "f2fs"
    "fat8"
    "fat16"
    "fat32"
    "ntfs"
    "xfs"
    # "zfs"
  ];
  
  networking.hostName = "btrnix"; # Define your hostname.
  networking.networkmanager.enable = true;
  
  nix.settings = {
    auto-optimise-store = true;

    min-free = 128000000;
    max-free = 1000000000;

    experimental-features = [
      "nix-command"
      "flakes"
    ];

    warn-dirty = false;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;
  
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    geary
  ];
  
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    initialHashedPassword = "$y$j9T$QJEnGzcQE6bYNp4AEWJqa0$jQOJ5FC.lOXXI4TlISxCi3K7MMXV.zJo7lO22VwFq60";
  };
  
  programs.git = {
    enable = true;
    prompt.enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Simon W";
        email = "4751279+mister-simon@users.noreply.github.com";
      };
    };
  };

  environment.shellAliases = {
    nrb = "sudo nixos-rebuild boot --flake ~/nixos/#$HOSTNAME";
    nrs = "sudo nixos-rebuild switch --flake ~/nixos/#$HOSTNAME";
  };

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    tldr
    fzf
    helix
  ];

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}

