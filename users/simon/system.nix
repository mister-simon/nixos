{ pkgs, ... }:
{
  users.users.simon = {
    isNormalUser = true;
    description = "simon";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
  };
}
