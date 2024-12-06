{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    #   histSize = 10000;

    #   autosuggestions.enable = true;
    #   syntaxHighlighting.enable = true;

    #   enableBashCompletion = true;
    #   enableCompletion = true;
    #   enableLsColors = true;

    #   ohMyZsh.enable = true;
    #   ohMyZsh.plugins = [ ];
    #   ohMyZsh.theme = "spaceship";
    #   ohMyZsh.customPkgs = [
    #     pkgs.spaceship-prompt
    #   ];
  };

  users.defaultUserShell = pkgs.zsh;
}
