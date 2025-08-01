{ ... }:
{
  # Enable the COSMIC login manager
  services.displayManager.cosmic-greeter.enable = true;

  # Enable the COSMIC desktop environment
  services.desktopManager.cosmic.enable = true;

  # Enable xwayland compat
  services.desktopManager.cosmic.xwayland.enable = true;
}
