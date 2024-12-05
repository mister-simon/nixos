{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vial
  ];

  # Allow vial to access my kb
  services.udev.packages = [ pkgs.vial ];
}
