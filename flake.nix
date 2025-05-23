{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.disko.url = "github:nix-community/disko/latest";
  inputs.disko.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, disko, nixpkgs }@inputs: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in
  {
    nixosConfigurations.btrnix = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      inherit system;
      
      specialArgs = {
        inherit system;
        inherit inputs;
      };
      
      modules = [
        ./configuration.nix
        disko.nixosModules.disko
        ./disko-config.nix
      ];
    };
  };
}
