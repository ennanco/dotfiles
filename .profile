# ~/.profile: Global environment and session variables

# 1. Load XDG configuration first (required by other settings)
if [ -f "$HOME/.config/bash/conf.d/env/xdg.sh" ]; then
    . "$HOME/.config/bash/conf.d/env/xdg.sh"
fi

# 2. Base PATH
export PATH="$HOME/.scripts:$PATH"
[ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/juliaup/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"

# 3. Development tooling
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export PATH="$CARGO_HOME/bin:$PATH"

# 4. Application preferences
export EDITOR='vim'
export BROWSER='brave-browser'
export READER='zathura'
export TERMINAL='mate-terminal'
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
