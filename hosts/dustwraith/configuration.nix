{
  pkgs,
  pkgs-stable,
  localhosts,
  lib,
  inputs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.xremap-flake.nixosModules.default
  ];

  # Bootloader.
  boot = {
    # Set up the loader
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;

    # Make the boot quieter
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [ "quiet" ];
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
    hostName = "dustwraith";
    networkmanager.enable = true;
    hosts = lib.mkMerge [
      { "192.168.56.56" = [ "homestead.test" ]; }
      localhosts.hosts
    ];
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
      options = "caps:backspace";
    };
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Enabling xremap
  hardware.uinput.enable = true;
  users.groups.uinput.members = [ "simon" ];
  users.groups.input.members = [ "simon" ];

  services.xremap = {
    withGnome = true;
    userName = "simon";
    config = {
      keymap = [
        {
          name = "main";
          remap = {
            "capslock" = "backspace";
          };
        }
      ];
    };
  };

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

  # Define a user account.
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      # Gnome
      dconf-editor
      gnomeExtensions.blur-my-shell
      gnomeExtensions.pop-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.caffeine
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.hibernate-status-button
      gnomeExtensions.wtmb-window-thumbnails

      # Web / Mail
      google-chrome
      # protonmail-desktop

      # error: betterbird has been removed as there were insufficient
      # maintainer resources to keep up with security updates
      # betterbird

      # Work
      # dbeaver-bin
      # inkscape

      # Other
      vial
      # discord
      pulseaudioFull
      # notesnook
      # obsidian
    ];
  };

  # Virtualbox things and stuff
  users.extraGroups.vboxusers.members = [ "simon" ];

  virtualisation.virtualbox = {
    host.enable = true;
    guest.enable = true;
    guest.dragAndDrop = true;
    guest.clipboard = true;
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

  # Install firefox.
  programs.firefox.enable = true;

  # Set up flatpak (via nix-flatpak)
  services.flatpak = {
    enable = true;
    packages = [
      "eu.betterbird.Betterbird"
      "io.github.zen_browser.zen"
    ];
    update.onActivation = true;
  };

  # Enable generic linked binaries (nodejs managed with fnm, etc)
  programs.nix-ld.enable = true;

  environment = {
    # Configure Gnome
    gnome.excludePackages = with pkgs; [
      gnome-tour
      epiphany
      geary
    ];

    variables.EDITOR = "nvim";

    systemPackages =
      (with pkgs; [
        # CLI
        git
        gh
        neovim
        wget
        curl
        bat
        fnm
        zip
        tldr
        fzf
        fd

        # Nix
        nixfmt-rfc-style
        nixd

        # Other
        flatpak
        # onlyoffice-bin
      ])
      ++ (with pkgs-stable; [
        vagrant
      ]);
  };

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "FiraCode"
          "JetBrainsMono"
          "Mononoki"
          "Monaspace"
        ];
      })
    ];

    fontconfig.defaultFonts = {
      monospace = [ "JetBrainsMono" ];
    };
  };

  system.stateVersion = "24.05"; # Comment the you read did?
}
