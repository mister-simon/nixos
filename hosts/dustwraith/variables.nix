{
  # Git Configuration ( For Pulling Software Repos )
  gitUsername = "Simon W";
  gitEmail = "4751279+mister-simon@users.noreply.github.com";

  # Hyprland Settings
  extraMonitorSettings = ''
  '';

  # Waybar Settings
  clock24h = false;

  # Program Options
  browser = "flatpak run app.zen_browser.zen"; # Set Default Browser (google-chrome-stable for google-chrome)
  terminal = "ghostty"; # Set Default System Terminal
  keyboardLayout = "gb";
  consoleKeyMap = "uk";

  # For Nvidia Prime support
  nvidiaID = "PCI:1:0:0";
  intelID = "PCI:0:2:0";

  # Enable NFS
  enableNFS = true;

  # Enable Printing Support
  printEnable = true;

  # Set Stylix Image
  stylixImage = ../../stylix-imgs/dkportrait0001.png;
  bgImage = ../../wallpapers/landscape-crop-smaller.png;

  # Set Waybar
  waybarChoice = ../../modules/home/waybar/waybar-simple-simon.nix;

  # Set Animation style
  animChoice = ../../modules/home/hyprland/animations-end4-speedy.nix;

  # Enable Thunar GUI File Manager
  thunarEnable = true;

  # Gaming
  gamesEnable = false;
}
