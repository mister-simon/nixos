{disko, ...}: {
  imports = [
    ./hardware.nix
    ./host-packages.nix
    disko.nixosModules.disko
    ./disko-config.nix
  ];
}
