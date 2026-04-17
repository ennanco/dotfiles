# ~/.config/bash/conf.d/nvm.sh
# Node Version Manager (NVM) with lazy loading

if [ -z "$NVM_DIR" ]; then
    NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
fi

if [ -d "$NVM_DIR" ]; then
    load_nvm() {
        [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
    }

    nvm() { unset -f nvm node npm npx; load_nvm; nvm "$@"; }
    node() { unset -f nvm node npm npx; load_nvm; node "$@"; }
    npm() { unset -f nvm node npm npx; load_nvm; npm "$@"; }
    npx() { unset -f nvm node npm npx; load_nvm; npx "$@"; }

    codex() { unset -f codex; load_nvm; codex "$@"; }
    gemini() { unset -f gemini; load_nvm; gemini "$@"; }
    claude() { unset -f claude; load_nvm; claude "$@"; }
fi
