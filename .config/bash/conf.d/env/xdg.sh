#!/bin/sh
# Guard against repeated sourcing
if [ -z "${_XDG_SH_LOADED:-}" ]; then
    export _XDG_SH_LOADED=1

    # General configuration of XDG folders
    export XDG_CONFIG_HOME="$HOME/.config"
    export XDG_CACHE_HOME="$HOME/.cache"
    export XDG_DATA_HOME="$HOME/.local/share"
    export XDG_STATE_HOME="$HOME/.local/state"

    # Program-specific paths
    export NVM_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/nvm"
    export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
    export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
fi
