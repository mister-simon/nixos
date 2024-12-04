{ pkgs, pkgs-stable, ... }:
{
  # Virtualbox things and stuff
  users.extraGroups.vboxusers.members = [ "simon" ];

  virtualisation.virtualbox = {
    host.enable = true;
    # guest.enable = true;
    # guest.dragAndDrop = true;
    # guest.clipboard = true;
  };

  environment.systemPackages = with pkgs-stable; [
    vagrant
  ];
}
