{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    helix
    neovim
    vscode
    nixfmt-rfc-style
    nixd
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
