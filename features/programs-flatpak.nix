{ pkgs, ... }:
{

  # Set up flatpak (via nix-flatpak)
  services.flatpak = {
    enable = true;
    update.onActivation = true;
  };

  environment.systemPackages = with pkgs; [
    flatpak
  ];
}
