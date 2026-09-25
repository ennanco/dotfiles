# ~/.profile: Global environment and session variables

# 1. Load XDG configuration first (required by other settings)
if [ -f "$HOME/.config/bash/conf.d/env/xdg.sh" ]; then
    . "$HOME/.config/bash/conf.d/env/xdg.sh"
fi

# Prepend a directory only when it is not already in PATH.
path_prepend() {
    case ":${PATH:-}:" in
        *:"$1":*) ;;
        *) export PATH="$1${PATH:+:$PATH}" ;;
    esac
}

# 2. Base PATH
path_prepend "$HOME/.scripts"
[ -d "$HOME/.local/bin" ] && path_prepend "$HOME/.local/bin"
path_prepend "$HOME/.local/share/juliaup/bin"
path_prepend "$HOME/.opencode/bin"

# 3. Development tooling
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
path_prepend "$CARGO_HOME/bin"

# 4. Application preferences retained for this machine
export EDITOR='vim'
export JULIAUP_DEPOT_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/julia"
export BAT_THEME='tokyonight_night'

# 5. LESS and terminal configuration
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

# 6. npm config paths under XDG
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/npm/npmrc"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/npm"

# 7. Environment modules
if [ -d "$HOME/.config/bash/conf.d/env" ]; then
    for file in "$HOME/.config/bash/conf.d/env"/*.sh; do
        [ -r "$file" ] && . "$file"
    done
fi
