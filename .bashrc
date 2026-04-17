# ~/.bashrc: Configuración para shells interactivos de Bash

# 1. Evitar ejecución si no es interactivo
case $- in
    *i*) ;;
    *) return;;
esac

# 2. Opciones de Bash y Historial (XDG_STATE_HOME)
shopt -s autocd
shopt -s checkwinsize
shopt -s histappend

if [ -n "$XDG_STATE_HOME" ]; then
    HISTFILE="$XDG_STATE_HOME/bash/history"
    [ ! -d "$XDG_STATE_HOME/bash" ] && mkdir -p "$XDG_STATE_HOME/bash"
fi

# ignoreboth (ignorespace + ignoredups) y erasedups para limpieza total
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=2000

# 3. Autocompletado del sistema
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# 4. Prompt y Visual (Starship)
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
else
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# 5. Colores
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# 6. CARGA MODULAR (Alias, FZF, Zoxide, XDG)
if [ -d "$HOME/.config/bash/conf.d" ]; then
    for file in "$HOME/.config/bash/conf.d"/*.sh; do
        [ -r "$file" ] && . "$file"
    done
fi
