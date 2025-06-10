{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    prompt.enable = true;
    config = {
      init = {
        defaultBranch = "main";
      };
      user = {
        name = "Simon W";
        email = "4751279+mister-simon@users.noreply.github.com";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    wget
    curl
    bat
    fnm
    zip
    tldr
    fzf
    fd
    tmux
    zellij
  ];
}
