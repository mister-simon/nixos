{
  pkgs,
  username,
  ...
}:
{
  services.greetd = {
    enable = true;
    vt = 3;
    settings = {
      initial_session = {
        user = username;
        command = "Hyprland";
      };
      default_session = {
        user = username;
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --remember --remember-session --time --cmd Hyprland"; # start Hyprland with a TUI login manager
      };
    };
  };
}
