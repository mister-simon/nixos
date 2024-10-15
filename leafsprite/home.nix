{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "simon";
  home.homeDirectory = "/home/simon";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Simon W";
    userEmail = "4751279+mister-simon@users.noreply.github.com";
  };

  programs.zoxide = {
    enable = true;
    enableBashIntegration = true;
    options = [ "--cmd cd" ];
  };

  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [ ];
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    shellAliases = {

      gs = "git status";
      gd = "git diff";
      gc = "git commit -m";
      gam = "git commit --amend --no-edit";
      game = "git commit --amend";
      gaa = "git add -A";
      ga = "git add .";
      gp = "git push";

      nrs = "sudo nixos-rebuild switch --flake ~/nixos/#leafsprite";
    };
    initExtra = ''
      # ~/.bashrc: executed by bash(1) for non-login shells.
      # If not running interactively, don't do anything
      case $- in
        *i*) ;;
          *) return;;
      esac

      # don't put duplicate lines or lines starting with space in the history.
      # See bash(1) for more options
      HISTCONTROL=ignoreboth

      # append to the history file, don't overwrite it
      shopt -s histappend

      # for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
      HISTSIZE=1000
      HISTFILESIZE=2000

      # check the window size after each command and, if necessary,
      # update the values of LINES and COLUMNS.
      shopt -s checkwinsize

      # set a fancy prompt (non-color, unless we know we "want" color)
      case "$TERM" in
        xterm-color|*-256color) color_prompt=yes;;
      esac

      export PROMPT_DIRTRIM=3

      if [ -f ${pkgs.git}/share/bash-completion/completions/git-prompt.sh ]; then
        source ${pkgs.git}/share/bash-completion/completions/git-prompt.sh

        if [ "$color_prompt" = yes ]; then
            PS1='\[\033[38;5;239m\]\A\[$(tput sgr0)\] ''${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\033[0;32m$(__git_ps1 " (%s)")\033[0m\$ '
        else
            PS1='\A ''${debian_chroot:+($debian_chroot)} \w$(__git_ps1 " (%s)")\$ '
        fi
      fi

      unset color_prompt force_color_prompt

      # If this is an xterm set the title to user@host:dir
      case "$TERM" in
      xterm* | rxvt*)
          PS1="\[\e]0;''${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
          ;;
      *) ;;
      esac

      # Alias definitions.
      # You may want to put all your additions into a separate file like
      # ~/.bash_aliases, instead of adding them here directly.
      # See /usr/share/doc/bash-doc/examples in the bash-doc package.

      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
    '';
  };
}
