# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash now added to bashrc the load of .profile
#if [ -n "$BASH_VERSION" ]; then
     #include .bashrc if it exists
#     [ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"
#fi

# set PATH so it includes user's private bin if it exists
PATH="$HOME/.scripts:$PATH"
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# LESS & MAN colors
export LESS=-R
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;31m'
#less more friendly for non text inputs
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
export LESSHISTFILE=-

# load aliases for the terminal defining some
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
#if exists load the variables XDG base directory
[ -f "$HOME/.config/xdgrc" ] && source "$HOME/.config/xdgrc";


#RUST HOME and CARGO home
#export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
#export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
#export PATH="$CARGO_HOME/bin:$PATH"
. $HOME/.cargo/env
