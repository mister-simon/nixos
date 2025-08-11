# SDDM is a display manager for X11 and Wayland
{
  pkgs,
  config,
  host,
  lib,
  ...
}:
let
  inherit (import ../../hosts/${host}/variables.nix)
    bgImage
    ;

  foreground = config.stylix.base16Scheme.base00;
  textColor = config.stylix.base16Scheme.base05;
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      Background = "${toString bgImage}";
      HeaderTextColor = "#${textColor}";
      DateTextColor = "#${textColor}";
      TimeTextColor = "#${textColor}";
      LoginFieldTextColor = "#${foreground}";
      PasswordFieldTextColor = "#${foreground}";
      UserIconColor = "#${foreground}";
      PasswordIconColor = "#${foreground}";
      WarningColor = "#${foreground}";
      LoginButtonBackgroundColor = "#${foreground}";
      SystemButtonsIconsColor = "#${foreground}";
      SessionButtonTextColor = "#${textColor}";
      VirtualKeyboardButtonTextColor = "#${textColor}";
      DropdownBackgroundColor = "#${foreground}";
      HighlightBackgroundColor = "#${textColor}";
    };
  };
in
{
  services.displayManager = {
    sddm = {
      package = pkgs.kdePackages.sddm;
      extraPackages = [ sddm-astronaut ];
      enable = true;
      wayland.enable = true;
      theme = "sddm-astronaut-theme";
    };
  };

  environment.systemPackages = [ sddm-astronaut ];

  # To prevent getting stuck at shutdown
  systemd.extraConfig = "DefaultTimeoutStopSec=10s";
}
