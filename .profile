# ~/.profile: Entorno global y variables de sesión

# 1. Carga de configuración XDG (Fundamental para todo lo demás)
if [ -f "$HOME/.config/bash/conf.d/xdg.sh" ]; then
    . "$HOME/.config/bash/conf.d/xdg.sh"
fi

# 2. PATH (Organizado y sin duplicados)
export PATH="$HOME/.scripts:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
export PATH="/home/quique/.local/share/juliaup/bin:$PATH"
export PATH="/home/quique/.opencode/bin:$PATH"

# 3. Herramientas de Desarrollo (Usando XDG definidas en xdg.sh)
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export PATH="$CARGO_HOME/bin:$PATH"

# 4. Preferencias de Aplicaciones
export EDITOR='vim'
export JULIAUP_DEPOT_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/julia"
export BAT_THEME='tokyonight_night'

# 5. Configuración de LESS y Terminal
export LESS='-R'
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;32m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;31m'
export LESSHISTFILE=-
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
