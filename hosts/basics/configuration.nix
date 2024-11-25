# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    # Set up the loader
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Point out the encrypted drive
    initrd.luks.devices."luks-744c1528-e02f-4384-a339-e403a9e1630f".device = "/dev/disk/by-uuid/744c1528-e02f-4384-a339-e403a9e1630f";

    # We should be able to read whatever fs we like...
    supportedFilesystems = [
      "ntfs"
      "exfat"
      "vfat"
      "btrfs"
      "reiserfs"
      "f2fs"
      "xfs"
      "cifs"
    ];
  };

  # Sundry settings for successful system storage
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

  # Clean yoself
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 20d --keep 20";
    flake = "/simon/nixos";
  };

  # Enable networking
  networking = {
    hostName = "leafsprite";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
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
  };

  # Enable hardware 🤞
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;

    # Enable the GNOME Desktop Environment.
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    # Configure keymap in X11
    xkb = {
      layout = "gb";
      variant = "";
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = (
      with pkgs;
      [
        # Other
        google-chrome
        protonmail-desktop
      ]
    );
  };

  # Autologin
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "simon";
  };
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };

  services.gnome = {
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Enable generic linked binaries (nodejs managed with fnm, etc)
  programs.nix-ld.enable = true;

  environment.variables.EDITOR = "vim";

  environment.systemPackages = (
    with pkgs;
    [
      # CLI
      git
      gh
      vim
      wget
      curl
      bat
      zip
      tldr
      fzf
      fd

      # Nix
      nixfmt-rfc-style
      nixd
    ]
  );

  system.stateVersion = "24.05"; # Did you read the comment?
}
