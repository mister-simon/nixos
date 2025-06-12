{ ... }:
{
  home.file.".p10k.zsh".source = ../../../sources/.p10k.zsh;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    zplug = {
      enable = true;
      plugins = [
        # { name = "zsh-users/zsh-autosuggestions"; } # Simple plugin installation
        {
          name = "romkatv/powerlevel10k";
          tags = [
            "as:theme"
            "depth:1"
          ];
        }
      ];
    };
  };
}
