# ~/.config/bash/conf.d/zoxide.sh
# Zoxide integration

if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init bash --cmd cd)"
fi
