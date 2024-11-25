# Readme

## Installation

 - Do basic install from usb
 - clone this repo to `~/nixos`
 - Copy `hardware-configuration.nix` to the local repo and update `initrd.luks.devices` if necessary
 - `sudo rm -rf /etc/nixos`
 - `sudo ln -s ~/nixos /etc/nixos`
 - `nix-shell`a
 - `sudo nixos-rebuild switch --flake ~/nixos/#leafsprite`
 - `cp ~/nixos/localhosts ~/localhosts`
 - `nix registry add localhosts path:/home/simon/localhosts` (or use `path:/home/simon/nixos/localhosts`)
 - `update-hosts`
a