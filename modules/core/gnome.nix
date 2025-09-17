{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;

  # Allow setting up online accounts
  services.gnome.gnome-online-accounts.enable = true;

  environment = {
    gnome.excludePackages = with pkgs; [
      gnome-tour
      epiphany
      geary
    ];
  };
}
