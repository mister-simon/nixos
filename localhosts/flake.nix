{
  description = ''
    This will store any local changes to a local hosts file.
    Copy this to ~/localhosts to be used as an untracked flake input.
  '';

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      # Formatting
      formatter."x86_64-linux" = pkgs.nixfmt-rfc-style;

      hosts = {
        # "192.168.56.56" = [ "example.test" ];
      };
    };
}
