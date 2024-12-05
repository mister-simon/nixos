{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    notesnook
    obsidian
  ];
}
