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

  security.pam.services.gdm.enableGnomeKeyring = true;
}
