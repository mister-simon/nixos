{ ... }:
{
  # Clean yoself
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 20d --keep 20";
    flake = "/simon/nixos";
  };
}
