{ ... }:
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
    ../../features/boot-plymouth.nix # Plymouth boot loader?
    ../../features/networking.nix # Enable networking and merge in localhosts
    ../../features/i18n.nix # Time, keyboard, localisation
    ../../features/nix.nix # Nix housekeeping.
    ../../features/nh.nix # Nix garbage collection
    ../../features/gnome.nix # Enable gnome
    # ../../features/gnome-autologin.nix # Enable autologin
    ../../features/printing.nix # Enable cups
    ../../features/sound.nix # Enables sound
    ../../features/sound-combined-sink.nix # Combined audio sink for pipewire
    ../../features/fonts.nix # Fonts, nerdfonts, etc
    ../../features/hardware-graphics.nix # Basic hardware enable

    # Programs
    ../../features/programs-generic.nix # General program settings
    ../../features/programs-flatpak.nix # Enable flatpaks via nix-flatpak
    ../../features/programs-browsers.nix # Web browsers
    ../../features/programs-mail.nix # Mail browsers
    ../../features/programs-database.nix # Database browsers
    ../../features/programs-cli.nix # Git + CLI tools
    ../../features/programs-zsh.nix # Basic zsh setup
    ../../features/programs-php.nix # PHP
    ../../features/programs-text-editor.nix # Text editors, formatting + env
    ../../features/programs-image-editor.nix # Image editors
    ../../features/programs-note-editor.nix # Notetaking programs
    ../../features/programs-office.nix # Office tools
    ../../features/programs-virtualbox.nix # Virtualisation via virtualbox
    ../../features/programs-docker.nix # Virtualisation via docker
    ../../features/programs-chat.nix # Chat programs
    ../../features/programs-vial.nix # Keyboard configuring
    ../../features/programs-vpn.nix # VPN Provider
  ];

  boot.initrd.luks.devices."luks-744c1528-e02f-4384-a339-e403a9e1630f".device =
    "/dev/disk/by-uuid/744c1528-e02f-4384-a339-e403a9e1630f";

  networking.hostName = "leafsprite";

  system.stateVersion = "24.05"; # Did you read the comment?
}
