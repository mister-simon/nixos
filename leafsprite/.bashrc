# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

export PROMPT_DIRTRIM=3

if [ -f "$git_prompt" ]; then
    source "$git_prompt"

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

if [ -f "$fnm_bin" ]; then
    eval "$($fnm_bin env --use-on-cd --shell bash)"
fi
