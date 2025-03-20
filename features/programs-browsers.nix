{ pkgs, ... }:
{
  # Install firefox.
  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    google-chrome
  ];

  services.flatpak.packages = [
    "io.github.zen_browser.zen"
  ];
}
