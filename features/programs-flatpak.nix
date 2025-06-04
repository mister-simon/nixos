{ ... }:
{
  # Set up flatpak (via nix-flatpak)
  services.flatpak = {
    enable = true;
    update.auto = {
      enable = true;
      onCalendar = "weekly"; # Default value
    };
  };
}
