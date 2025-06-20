# ZaneyOS - https://gitlab.com/-/ide/project/Zaney/zaneyos/edit/main/-
{
  description = "ZaneyOS - Simon's Spin";

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nvf.url = "github:notashelf/nvf";
    stylix.url = "github:danth/stylix/release-25.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak?ref=latest";
    disko = {
      url = "github:nix-community/disko/latest";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
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
