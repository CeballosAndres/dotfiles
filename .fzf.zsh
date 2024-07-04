# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/opt/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/opt/fzf/bin"
fi

# Auto-completion
# ---------------
source "/opt/homebrew/opt/fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/opt/homebrew/opt/fzf/shell/key-bindings.zsh"
#
# # FZF configuration
# export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# export FZF_PREVIEW_ADVANCED=true
# export FZF_PREVIEW_WINDOW='right:65%:nohidden'
# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
export FZF_DEFAULT_OPTS='--height 60% --layout=reverse --border'
export FZF_DEFAULT_OPTS="--color="$BG_COLOR" "$FZF_DEFAULT_OPTS
# export FZF_DEFAULT_OPTS="--color=dark ${FZF_DEFAULT_OPTS}"

# ch - browse chrome history
ch() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  cp -f ~/Library/Application\ Support/Google/Chrome/Profile\ 1/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

# Use ~~ as the trigger sequence instead of the default **
# export FZF_COMPLETION_TRIGGER='~~'

# Options to fzf command
# export FZF_COMPLETION_OPTS='--border --info=inline'

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }

# Use fd to generate the list for directory completion
# _fzf_compgen_dir() {
#   fd --type d --hidden --follow --exclude ".git" . "$1"
# }

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# _fzf_comprun() {
#   local command=$1
#   shift
#
#   case "$command" in
#     cd)           fzf --preview 'tree -C {} | head -200'   "$@" ;;
#     export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
#     ssh)          fzf --preview 'dig {}'                   "$@" ;;
#     v)           fzf "$@" --preview 'bat --style=numbers --color=always --line-range :500 {}' ;;
#     *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
#   esac
# }
