#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=vim
export HISTCONTROL=ignoreboth:erasedups
export PROMPT_DIRTRIM=2
export PATH="$PATH:$(yarn global bin):$HOME/.local/bin"
alias ls='ls --color=auto'
alias la='ls -A'
alias ll='ls -l'

export PS1="[\[$(tput sgr0)\]\[\033[38;5;247m\]\A\[$(tput sgr0)\]]-(\[$(tput sgr0)\]\[\033[38;5;247m\]\w\[$(tput sgr0)\])-> \[$(tput sgr0)\]\[\033[38;5;87m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"
