# ~/.bash_profile: Cargador inicial para login shells

# Cargar .profile si existe
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

# Cargar .bashrc si es una sesión interactiva de Bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
