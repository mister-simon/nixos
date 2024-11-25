/*
  Note to self ... Some repos to draw inspiration from:

   - https://gitlab.com/engmark/root
   - https://github.com/EmergentMind/nix-config
   - https://github.com/librephoenix/nixos-config
   - https://github.com/LongerHV/nixos-configuration
   - https://code.m3tam3re.com/m3tam3re/nixcfg
   - https://gitlab.com/Zaney/zaneyos

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
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    # I want to manage some additions to my hosts file
    # locally without tracking in this repo.
    # Avoids hard coding work project names and such into this repo.
    # `nix registry add localhosts path:/home/simon/nixos/localhosts`
    localhosts.url = "flake:localhosts";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      localhosts,
      nixos-wsl,
      nix-flatpak,
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
        # Desktop PC
        leafsprite = nixpkgs.lib.nixosSystem rec {
          inherit pkgs;
          inherit system;
          specialArgs = {
            inherit pkgs-stable;
            inherit inputs;
            inherit localhosts;
          };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
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

        # Debug mode / brand new NixOS
        basics = nixpkgs.lib.nixosSystem rec {
          inherit pkgs;
          inherit system;
          specialArgs = {
            inherit pkgs-stable;
            inherit inputs;
            inherit localhosts;
          };
          modules = [
            # nix-flatpak.nixosModules.nix-flatpak
            ./basics/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./basics/home.nix;
            }
          ];
        };

        # WSL 😬
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            nixos-wsl.nixosModules.default
            ./wsl/configuration.nix
          ];
        };
      };
    };
}
