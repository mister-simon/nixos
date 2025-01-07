{
  pkgs,
  pkgs-stable,
  pkgs-566e53c2,
  ...
}:
{
  # Virtualbox things and stuff
  users.extraGroups.vboxusers.members = [ "simon" ];

  virtualisation.virtualbox = {
    host.enable = true;
    host.package = pkgs-566e53c2.virtualbox;
  };

  environment.systemPackages = with pkgs-stable; [
    vagrant
  ];
}
