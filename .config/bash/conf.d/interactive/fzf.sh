# ~/.config/bash/conf.d/fzf.sh
# FZF integration and previews

if [ -f ~/.fzf.bash ]; then
    . ~/.fzf.bash
    export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
    export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

    fzf_comprun() {
        local command=$1
        shift
        case "$command" in
            cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
            export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
            ssh)          fzf --preview 'dig {}' "$@" ;;
            *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
        esac
    }
fi
