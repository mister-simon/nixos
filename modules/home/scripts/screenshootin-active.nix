{ pkgs }:

pkgs.writeShellScriptBin "screenshootin-active" ''
  time=$(date "+%d-%b_%H-%M-%S")
  dir="''${HOME}/Pictures/Screenshots"
  file="Screenshot_''${time}_''${RANDOM}.png"

  active_window_class=$(hyprctl -j activewindow | ${pkgs.jq}/bin/jq -r '(.class)')
  active_window_file="Screenshot_''${time}_''${active_window_class}.png"
  active_window_path="''${dir}/''${active_window_file}"

  hyprctl -j activewindow | ${pkgs.jq}/bin/jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - "''${active_window_path}"
''
