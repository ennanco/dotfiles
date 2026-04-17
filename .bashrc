# ~/.bashrc: Configuration for interactive Bash shells

# 1. Exit early for non-interactive shells
case $- in
    *i*) ;;
    *) return;;
esac

# 2. Bash behavior and history (XDG_STATE_HOME)
shopt -s autocd
shopt -s checkwinsize
shopt -s histappend

if [ -n "$XDG_STATE_HOME" ]; then
    HISTFILE="$XDG_STATE_HOME/bash/history"
    [ ! -d "$XDG_STATE_HOME/bash" ] && mkdir -p "$XDG_STATE_HOME/bash"
fi

HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=2000

# 3. System completion
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# 4. Prompt and visuals
if [ -x /usr/local/bin/starship ]; then
    eval "$(starship init bash)"
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# 5. Colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# 6. Interactive modules
if [ -d "$HOME/.config/bash/conf.d/interactive" ]; then
    for file in "$HOME/.config/bash/conf.d/interactive"/*.sh; do
        [ -r "$file" ] && . "$file"
    done
fi
