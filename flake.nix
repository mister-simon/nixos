# Note to self ... Some repos to draw inspiration from:
# https://gitlab.com/engmark/root
# https://github.com/EmergentMind/nix-config
# https://github.com/librephoenix/nixos-config
# https://github.com/LongerHV/nixos-configuration
{
  description = "Simon's Very Good NixOS Flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixos-hardware.url = "github:NixOS/nixos-hardware";
    # php.url = "github:loophp/php-src-nix";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations = {
        leafsprite = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            inherit inputs;
          };
          modules = [
            ./leafsprite/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./leafsprite/home.nix;
            }
          ];
        };
      };
    };
}
