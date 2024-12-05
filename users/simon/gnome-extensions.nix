{ pkgs, ... }:
{
  users.users.simon.packages = (
    with pkgs;
    [
      dconf-editor
      gnomeExtensions.blur-my-shell
      gnomeExtensions.pop-shell
      gnomeExtensions.dash-to-dock
      gnomeExtensions.caffeine
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.hibernate-status-button
      gnomeExtensions.wtmb-window-thumbnails
    ]
  );
}
