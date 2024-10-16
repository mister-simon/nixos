# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  pkgs,
  pkgs-stable,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-326b13f9-6b2b-4b44-a9e2-6de79c4e981e".device = "/dev/disk/by-uuid/326b13f9-6b2b-4b44-a9e2-6de79c4e981e";

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

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    hostName = "leafsprite";
    networkmanager.enable = true;
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
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure Gnome
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    epiphany
    geary
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
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
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  # Virtualbox things and stuff
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "simon" ];
  virtualisation.virtualbox.guest.enable = true;
  virtualisation.virtualbox.guest.dragAndDrop = true;
  virtualisation.virtualbox.guest.clipboard = true;

  # Autologin
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "simon";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 20d --keep 20";
    flake = "/simon/nixos";
  };

  # Install firefox.
  programs.firefox.enable = true;

  programs.nix-ld.enable = true;

  environment.systemPackages =
    (with pkgs; [
      # CLI
      git
      gh
      vim
      wget
      curl
      bat
      fnm

      # PHP
      php83
      php83Packages.composer
      php83Extensions.ctype
      php83Extensions.curl
      php83Extensions.dom
      php83Extensions.fileinfo
      php83Extensions.filter
      # php83Extensions.hash # Couldn't find this one in package search...
      php83Extensions.mbstring
      php83Extensions.openssl
      # php83Extensions.pcre # Couldn't find this one either...
      php83Extensions.pdo
      php83Extensions.session
      php83Extensions.tokenizer
      php83Extensions.xml

      # Nix
      nixfmt-rfc-style
      nil

      # Gnome
      gnomeExtensions.blur-my-shell
      gnomeExtensions.pop-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.caffeine
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.hibernate-status-button
      dconf-editor

      # Other
      google-chrome
    ])
    ++ (with pkgs-stable; [
      vagrant
    ]);

  fonts = {
    packages = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];

    fontconfig = {
      defaultFonts = {
        monospace = [ "FiraCode" ];
      };
    };
  };

  environment.variables.EDITOR = "vim";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
