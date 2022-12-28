# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#ADD THE GENERAL PROFILE WITH OTIONS FOR ANY CMD
[ -f ~/.profile ] && source ~/.profile

#GENERAL BEHAVIOUR
shopt -s autocd #automatic cd folder when name on commandline
shopt -s checkwinsize # check the window size and update if resized
setxkbmap -option ctrl:nocaps # remap CAPS_LOCK to Ctrl


 #CMD History
shopt -s histappend    # append to the history file, don't overwrite it
HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history.
HISTSIZE=1000
HISTFILESIZE=2000

# turn on autocompletion
if [ -f /usr/share/bash-completion/bash_completion ]; then
   . /usr/share/bash-completion/bash_completion
fi

#LOOK & FEEL
if [ -f /usr/local/lib/python3.7/dist-packages/powerline/bindings/bash/powerline.sh ]; then
    powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source /usr/local/lib/python3.7/dist-packages/powerline/bindings/bash/powerline.sh
else
    export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
    # PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -f /usr/share/autojump/sutojump.sh ] && source /usr/share/autojump/autojump.sh
