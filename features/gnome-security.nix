{ ... }:
{
  # Autologin
  services.displayManager = {
    autoLogin.enable = true;
    autoLogin.user = "simon";
  };
  systemd.services = {
    "getty@tty1".enable = false;
    "autovt@tty1".enable = false;
  };

  services.gnome = {
    gnome-keyring.enable = true;
    gnome-online-accounts.enable = true;
  };
}
