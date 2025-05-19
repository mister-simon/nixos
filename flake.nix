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
    nixpkgs-566e53c2.url = "github:NixOS/nixpkgs/566e53c2ad750c84f6d31f9ccb9d00f823165550";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    localhosts.url = "path:/home/simon/localhosts";
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      nixpkgs-566e53c2,
      home-manager,
      localhosts,
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
      pkgs-566e53c2 = import nixpkgs-566e53c2 {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Formatting
      formatter.${system} = pkgs.nixfmt-rfc-style;

      # NixOS
      nixosConfigurations = {
        # Desktop PC
        leafsprite = nixpkgs.lib.nixosSystem rec {
          inherit pkgs;
          inherit system;
          specialArgs = {
            inherit pkgs-stable;
            inherit pkgs-566e53c2;
            inherit inputs;
            inherit localhosts;
          };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            ./hosts/leafsprite/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = specialArgs;
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.simon = import ./hosts/leafsprite/home.nix;
              home-manager.backupFileExtension = "bak";
            }
          ];
        };
      };
    };
}
