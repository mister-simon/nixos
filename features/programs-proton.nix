{ pkgs, ... }:
{
  # Testing out other proton things
  environment.systemPackages = with pkgs; [
    proton-pass
  ];
}
