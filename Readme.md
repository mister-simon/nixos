# Readme

## Installation

 - Do basic install from usb
 - clone this repo to `~/nixos`
 - Copy `hardware-configuration.nix` to the local repo and update `initrd.luks.devices` if necessary
 - `nix-shell`
 - `cp ~/nixos/localhosts ~/localhosts`
 - `nix registry add localhosts path:/home/simon/localhosts` (or use `path:/home/simon/nixos/localhosts`)
 - `sudo nixos-rebuild switch --flake ~/nixos/#leafsprite`
 - `update-hosts`

## Another thing

Sometimes it's nice to make a branch with the current date:

```bash
git switch -c "update-$(date +%Y%m%d)"
``