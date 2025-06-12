{ lib, ... }:
{
  home.file.".p10k.zsh".source = ../../../sources/.p10k.zsh;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;

    initContent =
      let
        p10kInstantPrompt = lib.mkOrder 500 ''
          # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
          # Initialization code that may require console input (password prompts, [y/n]
          # confirmations, etc.) must go above this block; everything else may go below.
          if [[ -r "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
            source "''${XDG_CACHE_HOME:-''$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
          fi
        '';

        p10kSrc = lib.mkOrder 1500 ''
          # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
          [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
        '';
      in
      lib.mkMerge [
        p10kInstantPrompt
        p10kSrc
      ];

    zplug = {
      enable = true;
      plugins = [
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
