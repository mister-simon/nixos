{ pkgs, ... }:
{
  # Enable the GNOME Desktop Environment.
  services.desktopManager.gnome.enable = true;
  services.displayManager.gdm.enable = true;

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
