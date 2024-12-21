{ config, ... }:
{
  imports = [
    # Global
    ./hardware-configuration.nix

    # User
    ../../users/simon/system.nix # Adds the user to the system
    ../../users/simon/gnome-extensions.nix # Adds gnome extensions

    # General
    ../../features/boot.nix # General boot features and filesystem support
    ../../features/boot-quietly.nix # Less stuff showing up at boot
    # ../../features/boot-plymouth.nix # Plymouth boot loader?
    ../../features/networking.nix # Enable networking and merge in localhosts
    ../../features/i18n.nix # Time, keyboard, localisation
    ../../features/nix.nix # Nix housekeeping.
    ../../features/nh.nix # Nix garbage collection
    ../../features/gnome.nix # Enable gnome
    # ../../features/gnome-autologin.nix # Enable autologin
    ../../features/printing.nix # Enable cups
    ../../features/sound.nix # Enables sound
    # ../../features/sound-combined-sink.nix # Combined audio sink for pipewire
    ../../features/fonts.nix # Fonts, nerdfonts, etc
    # ../../features/hardware-graphics.nix # Basic hardware enable

    # Programs
    ../../features/programs-generic.nix # General program settings
    # ../../features/programs-flatpak.nix # Enable flatpaks via nix-flatpak
    ../../features/programs-browsers.nix # Web browsers
    ../../features/programs-mail.nix # Mail browsers
    ../../features/programs-database.nix # Database browsers
    ../../features/programs-cli.nix # Git + CLI tools
    ../../features/programs-php.nix # PHP
    ../../features/programs-text-editor.nix # Text editors, formatting + env
    # ../../features/programs-image-editor.nix # Image editors
    ../../features/programs-note-editor.nix # Notetaking programs
    # ../../features/programs-office.nix # Office tools
    ../../features/programs-virtualbox.nix # Virtualisation via virtualbox
    # ../../features/programs-docker.nix # Virtualisation via docker
    ../../features/programs-chat.nix # Chat programs
    # ../../features/programs-vial.nix # Keyboard configuring
    ../../features/programs-vpn.nix # VPN Provider

    # Other laptop stuff
    ./fingerprint-reader.nix
    ./xremap.nix
  ];

  # Bootloader.
  boot.initrd.luks.devices."luks-cef16352-8b6c-4c9a-bc40-c077a1cc2ccb".device =
    "/dev/disk/by-uuid/cef16352-8b6c-4c9a-bc40-c077a1cc2ccb";

  networking.hostName = "dustwraith";

  system.stateVersion = "24.11"; # Did you read the comment?

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
  };

  specialisation.dedicated-gpu.configuration = {
    system.nixos.tags = [ "dedicated-gpu" ];

    programs.steam = {
      enable = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = false;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      # Currently alpha-quality/buggy, so false is currently the recommended setting.
      open = false;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        sync.enable = true;

        # Make sure to use the correct Bus ID values for your system!
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = "PCI:0:2:0";
        # amdgpuBusId = "PCI:54:0:0"; For AMD GPU
      };
    };
  };
}
