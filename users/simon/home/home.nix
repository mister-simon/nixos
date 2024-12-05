{ ... }:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
