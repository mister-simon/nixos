{ host, ... }:
let
  inherit (import ../../../hosts/${host}/variables.nix)
    browser
    terminal
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bindr = [
      "$modifier,SUPER_L,exec,rofi-launcher"
    ];
    bind = [
      "$modifier SHIFT,T,exec,uwsm app -- ${terminal}"
      "$modifier,K,exec,list-keybinds"
      "$modifier SHIFT,W,exec,web-search"
      "$modifier ALT,W,exec,wallsetter"
      "$modifier SHIFT,N,exec,swaync-client -rs"
      "$modifier,W,exec,${browser}"
      "$modifier,Y,exec,uwsm app -- ghostty -e yazi"
      "$modifier,E,exec,emopicker9000"
      ",PRINT,exec,hyprshot -m region"
      "ALT,PRINT,exec,hyprshot -m window"
      # "$modifier,D,exec,uwsm app -- discord"
      # "$modifier,O,exec,uwsm app -- obs"
      "$modifier,C,exec,hyprpicker -a"
      # "$modifier,G,exec,uwsm app -- gimp"
      "$modifier,T,exec,pypr toggle term"
      "$modifier,M,exec,pavucontrol"
      "$modifier,Q,killactive,"
      "$modifier,P,pseudo,"
      "$modifier,V,exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"
      "$modifier SHIFT,I,togglesplit,"
      "$modifier,F,fullscreen,"
      "$modifier SHIFT,F,togglefloating,"
      "$modifier ALT,F,workspaceopt, allfloat"
      "$modifier SHIFT,C,exit,"
      "$modifier SHIFT,left,movewindow,l"
      "$modifier SHIFT,right,movewindow,r"
      "$modifier SHIFT,up,movewindow,u"
      "$modifier SHIFT,down,movewindow,d"
      # "$modifier SHIFT,h,movewindow,l"
      # "$modifier SHIFT,l,movewindow,r"
      # "$modifier SHIFT,k,movewindow,u"
      # "$modifier SHIFT,j,movewindow,d"
      "$modifier ALT, left, swapwindow,l"
      "$modifier ALT, right, swapwindow,r"
      "$modifier ALT, up, swapwindow,u"
      "$modifier ALT, down, swapwindow,d"
      "$modifier ALT, 43, swapwindow,l"
      "$modifier ALT, 46, swapwindow,r"
      "$modifier ALT, 45, swapwindow,u"
      "$modifier ALT, 44, swapwindow,d"
      "$modifier,left,movefocus,l"
      "$modifier,right,movefocus,r"
      "$modifier,up,movefocus,u"
      "$modifier,down,movefocus,d"
      # "$modifier,h,movefocus,l"
      # "$modifier,l,movefocus,r"
      # "$modifier,k,movefocus,u"
      # "$modifier,j,movefocus,d"

      # Workspace basics
      "$modifier,1,workspace,1"
      "$modifier,2,workspace,2"
      "$modifier,3,workspace,3"
      "$modifier,4,workspace,4"
      "$modifier,5,workspace,5"
      "$modifier,6,workspace,6"
      "$modifier,7,workspace,7"
      "$modifier,8,workspace,8"
      "$modifier,9,workspace,9"
      "$modifier,0,workspace,10"

      # Dual monitor workspace control
      "$modifier CONTROL,1,workspace,2"
      "$modifier CONTROL,1,workspace,1"
      "$modifier CONTROL,2,workspace,5"
      "$modifier CONTROL,2,workspace,4"
      "$modifier CONTROL,4,workspace,8"
      "$modifier CONTROL,4,workspace,7"
      "$modifier CONTROL,5,workspace,6"
      "$modifier CONTROL,5,workspace,3"
      "$modifier CONTROL,7,workspace,10"
      "$modifier CONTROL,7,workspace,9"

      "$modifier SHIFT,SPACE,movetoworkspace,special"
      "$modifier,SPACE,togglespecialworkspace"

      # Workspace moving
      "$modifier SHIFT,1,movetoworkspace,1"
      "$modifier SHIFT,2,movetoworkspace,2"
      "$modifier SHIFT,3,movetoworkspace,3"
      "$modifier SHIFT,4,movetoworkspace,4"
      "$modifier SHIFT,5,movetoworkspace,5"
      "$modifier SHIFT,6,movetoworkspace,6"
      "$modifier SHIFT,7,movetoworkspace,7"
      "$modifier SHIFT,8,movetoworkspace,8"
      "$modifier SHIFT,9,movetoworkspace,9"
      "$modifier SHIFT,0,movetoworkspace,10"

      # "$modifier CONTROL,right,workspace,e+1"
      # "$modifier CONTROL,left,workspace,e-1"
      # "$modifier,mouse_down,workspace, e+1"
      # "$modifier,mouse_up,workspace, e-1"

      # Windows
      "$modifier ALT,Tab,exec,rofi-window"
      "ALT,Tab,cyclenext"
      "ALT,Tab,bringactivetotop"

      # Speech to Text
      "$modifier SHIFT,L,exec,flatpak run net.mkiol.SpeechNote --action start-listening-clipboard --start-in-tray"
      "$modifier,L,exec,flatpak run net.mkiol.SpeechNote --action start-listening-active-window --start-in-tray"

      # Audio
      ",XF86AudioRaiseVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume,exec,wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      " ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioPlay, exec, playerctl play-pause"
      ",XF86AudioPause, exec, playerctl play-pause"
      ",XF86AudioNext, exec, playerctl next"
      ",XF86AudioPrev, exec, playerctl previous"
      ",XF86MonBrightnessDown,exec,brightnessctl set 5%-"
      ",XF86MonBrightnessUp,exec,brightnessctl set +5%"
    ];

    bindm = [
      "$modifier, mouse:272, movewindow"
      "$modifier, mouse:273, resizewindow"
    ];
  };
}
