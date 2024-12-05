{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
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
