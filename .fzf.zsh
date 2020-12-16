# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/sirius/.vim/plugged/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/sirius/.vim/plugged/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/sirius/.vim/plugged/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/sirius/.vim/plugged/fzf/shell/key-bindings.zsh"

export FZF_DEFAULT_OPTS="
    --height 50% --layout reverse --info inline --border \
    --preview 'bat --style=numbers --color=always --line-range :500 {}' --preview-window :noborder:hidden\
    --color 'fg:#bbccdd,fg+:#ddeeff,bg:#334455,preview-bg:#223344,border:#778899' --bind 'F2:toggle-preview'
"

export FZF_DEFAULT_COMMAND='fd'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export FZF_CTRL_T_OPTS="--preview '(bat {}) 2> /dev/null | head -200'"

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}


find-in-file() {
	grep --line-buffered --color=never -r "" * | fzf
}
zle -N find-in-file
bindkey '^f' find-in-file
