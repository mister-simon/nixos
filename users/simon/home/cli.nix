{
  pkgs,
  ...
}:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    defaultOptions = [
      "--margin=1"
      "--layout=reverse"
      "--border=none"
      "--info='hidden'"
      "--header=''"
      "--prompt='/ '"
      "-i"
      "--no-bold"
      "--bind='enter:execute(code -a {})'"
      "--preview='bat --style=numbers --color=always --line-range :500 {}'"
      "--preview-window=right:60%:wrap"
    ];

    defaultCommand = "${pkgs.fd}/bin/fd --type f --exclude .git --follow --hidden";
    changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d --exclude .git --follow --hidden";
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
