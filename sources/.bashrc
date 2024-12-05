# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

export PROMPT_DIRTRIM=3

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f "$fnm_bin" ]; then
    eval "$($fnm_bin env --use-on-cd --shell bash)"
    export FNM_COREPACK_ENABLED="true"
    eval "$($fnm_bin completions)"
fi

if [ -d ~/.config/composer/vendor/bin ]; then
    PATH="~/.config/composer/vendor/bin:$PATH"
fi
