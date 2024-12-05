{ config, lib, ... }:
{
  environment.shellAliases = lib.mkDefault {
    nrb = "sudo nixos-rebuild boot --flake ~/nixos/#${config.networking.hostName}";
    nrs = "sudo nixos-rebuild switch --flake ~/nixos/#${config.networking.hostName}";
    setup-hosts = "nix registry add localhosts path:/home/simon/localhosts";
    update-hosts = "nix flake update --flake ~/nixos localhosts";
  };
}
