{
  pkgs,
  ...
}:
{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;

    defaultOptions = [
      "--preview='${pkgs.bat}/bin/bat --color=always -n {}'"
      "--bind 'ctrl-/:toggle-preview'"
    ];
    defaultCommand = "${pkgs.fd}/bin/fd --type f --exclude .git --follow --hidden";
    changeDirWidgetCommand = "${pkgs.fd}/bin/fd --type d --exclude .git --follow --hidden";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };
}
