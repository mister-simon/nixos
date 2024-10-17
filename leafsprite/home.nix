{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Configure dconf / gnome extensions
  # use `dconf watch /`
  dconf = {
    enable = true;
    settings = {
      "org/gnome/settings-daemon/plugins/power" = {
        power-button-action = "hibernate";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = [
          pkgs.gnomeExtensions.blur-my-shell.extensionUuid
          pkgs.gnomeExtensions.pop-shell.extensionUuid
          pkgs.gnomeExtensions.dash-to-dock.extensionUuid
          pkgs.gnomeExtensions.caffeine.extensionUuid
          pkgs.gnomeExtensions.clipboard-indicator.extensionUuid
          pkgs.gnomeExtensions.hibernate-status-button.extensionUuid
        ];
        favorite-apps = [ ];
      };

      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-enable-primary-paste = false;
      };

      "org/gnome/desktop/screensaver" = {
        picture-options = "spanned";
        picture-uri = "file://${./sources/leafsprite-wide-bg.png}";
        primary-color = "#000000000000";
        secondary-color = "#000000000000";
      };

      "org/gnome/desktop/background" = {
        picture-options = "spanned";
        picture-uri = "file://${./sources/leafsprite-wide-bg.png}";
        picture-uri-dark = "file://${./sources/leafsprite-wide-bg.png}";
        primary-color = "#000000000000";
        secondary-color = "#000000000000";
      };

      "org/gnome/shell/extensions/pop-shell" = {
        tile-by-default = true;
        active-hint = true;
        show-title = false;
        gap-outer = lib.hm.gvariant.mkUint32 0;
        gap-inner = lib.hm.gvariant.mkUint32 0;
        mouse-cursor-follows-active-window = false;
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        display-mode = 1;
      };

      "org/gnome/shell/extensions/dash-to-dock" = {
        multi-monitor = true;
        show-trash = false;
        show-mounts = false;
        hot-keys = false;
        running-indicator-style = "DOTS";
        dash-max-icon-size = 60;
      };

      "org/gnome/mutter/keybindings" = {
        toggle-tiled-left = [ ];
        toggle-tiled-right = [ ];
      };

      "org/gnome/shell/keybindings" = {
        focus-active-notification = [ ];
        toggle-message-tray = [ ];
        toggle-quick-settings = [ ];
        switch-to-application-1 = [ ];
        switch-to-application-2 = [ ];
        switch-to-application-3 = [ ];
        switch-to-application-4 = [ ];
        switch-to-application-5 = [ ];
        switch-to-application-6 = [ ];
        switch-to-application-7 = [ ];
        switch-to-application-8 = [ ];
        switch-to-application-9 = [ ];
      };

      "org/gnome/desktop/wm/keybindings" = {
        # General window actions
        close = [ "<Super>q" ];
        toggle-maximized = [ "<Super>m" ];
        maximize = [ ];
        minimize = [ ];

        # Unbind default monitor management
        move-to-monitor-left = [ ];
        move-to-monitor-down = [ ];
        move-to-monitor-up = [ ];
        move-to-monitor-right = [ ];

        # Workspace management
        switch-to-workspace-1 = [ "<Super>1" ];
        switch-to-workspace-2 = [ "<Super>2" ];
        switch-to-workspace-3 = [ "<Super>3" ];
        switch-to-workspace-4 = [ "<Super>4" ];
        switch-to-workspace-5 = [ "<Super>5" ];
        switch-to-workspace-6 = [ "<Super>6" ];
        switch-to-workspace-7 = [ "<Super>7" ];
        switch-to-workspace-8 = [ "<Super>8" ];
        switch-to-workspace-9 = [ "<Super>9" ];

        move-to-workspace-1 = [
          "<Shift><Super><Home>"
          "<Shift><Super>1"
        ];
        move-to-workspace-2 = [ "<Shift><Super>2" ];
        move-to-workspace-3 = [ "<Shift><Super>3" ];
        move-to-workspace-4 = [ "<Shift><Super>4" ];
        move-to-workspace-5 = [ "<Shift><Super>5" ];
        move-to-workspace-6 = [ "<Shift><Super>6" ];
        move-to-workspace-7 = [ "<Shift><Super>7" ];
        move-to-workspace-8 = [ "<Shift><Super>8" ];
        move-to-workspace-9 = [ "<Shift><Super>9" ];
        move-to-workspace-last = [ "<Shift><Super><End>" ];
        move-to-workspace-left = [ "<Shift><Super>Page_Up" ];
        move-to-workspace-right = [ "<Shift><Super>Page_Down" ];
      };

      "org/gnome/desktop/interface" = {
        clock-show-weekday = true;
      };
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Simon W";
    userEmail = "4751279+mister-simon@users.noreply.github.com";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.vscode = {
    enable = true;
    # Manage extensions with vscode sync 🤷
  };

  home.file.".bash_aliases".source = ./sources/.bash_aliases;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake ~/nixos/#leafsprite";
    };
    initExtra = ''
      git_prompt="${pkgs.git}/share/bash-completion/completions/git-prompt.sh"
      fnm_bin="${pkgs.fnm}/bin/fnm"
      ${builtins.readFile ./sources/.bashrc}
      unset git_prompt fnm_bin
    '';
  };
}
