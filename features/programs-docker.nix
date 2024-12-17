{ pkgs, pkgs-stable, ... }:
{
  # Virtualbox things and stuff
  users.users.simon.extraGroups = [ "docker" ];

  virtualisation.docker = {
    enable = true;
  };
}
