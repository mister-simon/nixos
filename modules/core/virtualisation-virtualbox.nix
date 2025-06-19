{ pkgs, ... }:
{
  # Virtualbox things and stuff
  users.extraGroups.vboxusers.members = [ "simon" ];

  # Debugging for kvm incompatibility
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];

  virtualisation.virtualbox = {
    host.enable = true;
    # host.package = pkgs.virtualbox;
  };

  environment.systemPackages = with pkgs; [
    vagrant
  ];
}
