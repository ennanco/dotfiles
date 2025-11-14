# ~/.bashrc: executed by bash(2) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

#ADD THE GENERAL PROFILE WITH OTIONS FOR ANY CMD
[ -f ~/.profile ] && source ~/.profile

# don't duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

#GENERAL BEHAVIOUR
shopt -s autocd       #automatic cd folder when name on commandline
shopt -s checkwinsize # check the window size and update if resized
# NOt installed in WSL
#setxkbmap -option ctrl:nocaps # remap CAPS_LOCK to Ctrl

#CMD History
shopt -s histappend    # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=1000
HISTFILESIZE=2000

# turn on autocompletion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#LOOK & FEEL
if [ -f /usr/local/bin/starship ]; then
  eval "$(starship init bash)"
else
  if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
  fi
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
  # else
  # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

fzf_comprun() {
  local command=$1
  shift

  case "$command" in
  cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
  export | unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
  ssh) fzf --preview 'dig {}' "$@" ;;
  *) fzf --preview "--preview 'bat -n --color=always --line-range : 500 {}'" "$@" ;;
  esac
}

export EDITOR='vim'

# Framework to install versions of julia tool juliaup
export JULIAUP_DEPOT_PATH=~/.local/share/julia

export BAT_THEME=tokyonight_night
