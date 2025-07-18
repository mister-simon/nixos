# ZaneyOS - https://gitlab.com/-/ide/project/Zaney/zaneyos/edit/main/-
{
  description = "ZaneyOS - Simon's Spin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix.url = "github:danth/stylix";
    nvf.url = "github:notashelf/nvf";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      nixpkgs-stable,
      nix-flatpak,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      host = "zanix";
      profile = "nvidia";
      username = "simon";

      specialArgs = {
        inherit inputs;
        inherit username;
        inherit host;
        inherit profile;

        pkgs-unstable = import nixpkgs-unstable {
          inherit system;
          config.allowUnfree = true;
        };

        pkgs-stable = import nixpkgs-stable {
          inherit system;
          config.allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        amd = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./profiles/amd
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
        nvidia = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./profiles/nvidia
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
        nvidia-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./profiles/nvidia-laptop
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
        intel = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./profiles/intel
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          inherit specialArgs;
          modules = [
            ./profiles/vm
            nix-flatpak.nixosModules.nix-flatpak
          ];
        };
      };
    };
}
