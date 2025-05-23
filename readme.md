# Clean install this like so:

- `echo "key for the luks enc" > /tmp/secret.key`

- cd into this flake folder

- `lsblk` and replace `/dev/...` with the appropriate drive name

- `sudo nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount --flake .#btrnix`

- (It is also possible to re-mount via disko-config using only `--mode mount`)

- `mount | grep /mnt` to verify

- `sudo nixos-install --flake .#btrnix`

- If no password hash had been set yet then `sudo nixos-enter --root /mnt -c 'passwd simon'`
