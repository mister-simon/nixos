{
  pkgs,
  ...
}:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    options = [ "--cmd cd" ];
  };

  home.sessionVariables = {
    _ZO_DOCTOR = 0;
  };

  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij/config.kdl".source = ../../../sources/zellij-config.kdl;
}
