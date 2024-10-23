# Readme

## Installation

 - Do basic install from usb
 - clone this repo to `~/nixos`
 - `sudo rm -rf /etc/nixos`
 - `sudo ln -s ~/nixos /etc/nixos`
 - `nix-shell`
 - `sudo nixos-rebuild switch --flake ~/nixos/#leafsprite`
