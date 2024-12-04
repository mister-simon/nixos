{ ... }:
{
  imports = [
    ../leafsprite/home.nix
  ];

  home.shellAliases = {
    nrb = "sudo nixos-rebuild boot --flake ~/nixos/#dustwraith";
    nrs = "sudo nixos-rebuild switch --flake ~/nixos/#dustwraith";
    update-hosts = "nix flake update --flake ~/nixos localhosts && nrs";
  };

  dconf = {
    settings = {
      "org/gnome/desktop/screensaver" = {
        picture-options = "zoomed";
      };

      "org/gnome/desktop/background" = {
        picture-options = "zoomed";
      };
    };
  };
}
