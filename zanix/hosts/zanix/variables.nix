{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Simon W";
  gitEmail = "4751279+mister-simon@users.noreply.github.com";

  # Hyprland Settings
  extraMonitorSettings = ''
    monitor=HDMI-A-1,1920x1080@60.0,1920x0,1.0
    monitor=HDMI-A-2,1920x1080@60.0,0x0,1.0
  '';

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "flatpak run app.zen_browser.zen"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "kitty"; # Set Default System Terminal
  keyboardLayout = "gb";
  consoleKeyMap = "uk";

  # For Nvidia Prime support
  intelID = "PCI:1:0:0";
  nvidiaID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = false;

  # Set Stylix Image
  stylixImage = ../../wallpapers/leafsprite-wide-bg.png;

  # Set Waybar
  # Includes alternates such as waybar-curved.nix & waybar-ddubs.nix
  waybarChoice = ../../modules/home/waybar/waybar-simple-simon.nix;

  # Set Animation style
  # Available options are:
  # animations-def.nix  (default)
  # animations-end4.nix (end-4 project)
  # animations-dynamic.nix (ml4w project)
  animChoice = ../../modules/home/hyprland/animations-def.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;
}
