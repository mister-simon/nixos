{ inputs, ... }:
{
  imports = [
    # Hardware
    ./hardware.nix
    inputs.disko.nixosModules.disko
    ./disko-config.nix

    # Software
    ./host-packages.nix
    ./shell-aliases.nix
  ];
}
