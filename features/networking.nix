{ lib, localhosts, ... }:
{
  # Enable networking
  networking = {
    networkmanager.enable = true;
    hosts = lib.mkMerge [
      { "192.168.56.56" = [ "homestead.test" ]; }
      localhosts.hosts
    ];
  };
}
