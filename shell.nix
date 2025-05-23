# Shell for bootstrapping flake-enabled nix and other tooling
{
  pkgs ?
    # If pkgs is not defined, instantiate nixpkgs from locked commit
    let
      lock = (builtins.fromJSON (builtins.readFile ./flake.lock)).nodes.nixpkgs.locked;
      nixpkgs = fetchTarball {
        url = "https://github.com/nixos/nixpkgs/archive/${lock.rev}.tar.gz";
        sha256 = lock.narHash;
      };
    in
    import nixpkgs { overlays = [ ]; },
}:
{
  default = pkgs.mkShellNoCC {
    NIX_CONFIG = "extra-experimental-features = nix-command flakes";
    GIT_AUTHOR_NAME = "Simon W";
    GIT_AUTHOR_EMAIL = "4751279+mister-simon@users.noreply.github.com";

    nativeBuildInputs = builtins.attrValues {
      inherit (pkgs)
        nix
        home-manager
        git
        helix
        ;
    };
    
    shellHook = ''
	git config --global user.name "$GIT_AUTHOR_NAME"
	git config --global user.email  "$GIT_AUTHOR_EMAIL"
	git config --global init.defaultBranch "main"
	
	alias nrb="sudo nixos-rebuild boot --flake ~/nixos/#$HOSTNAME"
	alias nrs="sudo nixos-rebuild switch --flake ~/nixos/#$HOSTNAME"
    '';
  };
}
