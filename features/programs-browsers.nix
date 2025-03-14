{ pkgs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    google-chrome
    protonmail-desktop
  ];

  services.flatpak.packages = [
    "io.github.zen_browser.zen"
  ];
}
