{ pkgs, pkgs-stable, ... }:
{
  # Virtualbox things and stuff
  users.extraGroups.vboxusers.members = [ "simon" ];

  # Debugging for kvm incompatibility
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  virtualisation.virtualbox = {
    host.enable = true;
    host.package = pkgs-stable.virtualbox;
  };

  environment.systemPackages = with pkgs-stable; [
    vagrant
  ];
}
