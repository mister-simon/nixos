{inputs, ...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
    inputs.disko.nixosModules.disko
    ./disko-config.nix
  ];
}
