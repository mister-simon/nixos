/*
  Note to self ... Some repos to draw inspiration from:

   - https://gitlab.com/engmark/root
   - https://github.com/EmergentMind/nix-config
   - https://github.com/librephoenix/nixos-config
   - https://github.com/LongerHV/nixos-configuration

   More stuff to check out...

   - https://nixos-and-flakes.thiscute.world/
   - https://codeberg.org/justgivemeaname/.dotfiles
*/
{
  description = "Simon's Very Good NixOS Flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    localhosts.url = "path:/home/simon/localhosts";
    # nixos-hardware.url = "github:NixOS/nixos-hardware";
    # php.url = "github:loophp/php-src-nix";      
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      localhosts,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-stable = import nixpkgs-stable {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      formatter.${system} = pkgs.nixfmt-rfc-style;

      nixosConfigurations = {
        leafsprite = nixpkgs.lib.nixosSystem rec {
          inherit pkgs;
          inherit system;
          specialArgs = {
            inherit pkgs-stable;
            inherit inputs;
            inherit localhosts;
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
