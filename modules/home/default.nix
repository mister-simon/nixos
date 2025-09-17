{ host, ... }:
let
  inherit (import ../../hosts/${host}/variables.nix) waybarChoice;
in
{
  imports = [
    ./alacritty.nix
    ./amfora.nix
    ./bash
    ./bat.nix
    ./bottom.nix
    ./btop.nix
    ./cava.nix
    ./emoji.nix
    ./eza.nix
    ./fastfetch
    ./fzf.nix
    ./gh.nix
    ./ghostty.nix
    ./git.nix
    ./gnome
    ./gtk.nix
    ./htop.nix
    # ./hyprland
    ./kitty.nix
    ./lazygit.nix
    ./nvf.nix
    ./obs-studio.nix
    ./rofi
    ./qt.nix
    ./scripts
    ./starship.nix
    ./stylix.nix
    ./swappy.nix
    # ./swaync.nix
    ./tealdeer.nix
    ./tmux.nix
    ./virtmanager.nix
    # waybarChoice
    ./wezterm.nix
    ./wlogout
    ./xdg.nix
    ./yazi
    ./zellij
    ./zoxide.nix
    ./zsh
  ];
}
