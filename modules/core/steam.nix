{host, pkgs, ...}: let
  inherit (import ../../hosts/${host}/variables.nix) gamesEnable;
in {
  programs = {
    steam = {
      enable = gamesEnable;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      gamescopeSession.enable = true;
      extraCompatPackages = [pkgs.proton-ge-bin];
    };

    gamescope = {
      enable = gamesEnable;
      capSysNice = true;
      args = [
        "--rt"
        "--expose-wayland"
      ];
    };
  };
}
