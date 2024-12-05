{
  pkgs,
  ...
}:
{
  home.file.".bash_aliases".source = ../../../sources/.bash_aliases;

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
      fnm_bin="${pkgs.fnm}/bin/fnm"
      ${builtins.readFile ../../../sources/.bashrc}
      unset fnm_bin
    '';
  };
}
