# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# # Functions to change color
# change_color(){
#     sed -i -e "s/'dark'/'$1'/; s/'light'/'$1'/" ~/.tmux.conf
#     export BG_COLOR=$1
#     export BAT_THEME='Solarized ('$1')'
# }
#
# # Switch to Solarized Dark if we are currently in dark mode
# if [[ "$(uname -s)" == "Darwin" && ! -v BG_COLOR ]]; then
#   val=$(defaults read -g AppleInterfaceStyle 2>/dev/null)
#   if [[ $val == "Dark" ]]; then
#     change_color 'dark'
#   else
#     change_color 'light'
#   fi
# fi
#
#
# # Toggle between dark and light bg
# tc(){
#   if [[ $BG_COLOR == "dark" ]]; then
#     change_color 'light'
#   else
#     change_color 'dark'
#   fi
#   source ~/.zshrc
#   #tmux source ~/.tmux.conf
#   clear
# }

# Clean variable
# unset FZF_DEFAULT_OPTS

# Auto completions for brew
chmod -R go-w "$(brew --prefix)/share"
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit
  compinit
fi

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Color theme
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_INSTANT_PROMPT=quiet
# Avoid solow paste from clipboard
DISABLE_MAGIC_FUNCTIONS="true"

# FZF configuration
export FZF_PREVIEW_ADVANCED=true
export FZF_PREVIEW_WINDOW='right:65%:nohidden'

# export FZF_DEFAULT_OPTS="--color=dark ${FZF_DEFAULT_OPTS}"

# fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

source ~/.completio.zsh

plugins=(
  git
  history
  tmux
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  fzf-tab
  fzf-zsh-plugin # must be at the end
)

# Tmux autostart
export ZSH_TMUX_AUTOSTART=false
# export ZSH_TMUX_ITERM2=true

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export EDITOR="nvim"

export PATH="/usr/local/opt/python@3.7/bin:$PATH"
export PATH="/Users/andres/.samio/scripts/bin:$PATH"

# To set vim in terminal
# bindkey -v
# bindkey '^R' history-incremental-search-backward
# export KEYTIMEOUT=1
# autoload edit-command-line; zle -N edit-command-line
# bindkey '^e' edit-command-line

alias vim='nvim'
alias v='nvim'
alias ibrew="arch -x86_64 /usr/local/bin/brew"

echo -e "\033Ptmux;\033\033\033]50;SetProfile=dark-theme\a\e\\"

bindkey '^ ' autosuggest-accept

# asdf variables to compile
# ! comented bc a warning related whit xwmax 
. /opt/homebrew/opt/asdf/libexec/asdf.sh
export CFLAGS="-O2 -g -fno-stack-check"
#export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-ssl=$(brew --prefix openssl@1.1) --with-wx-config=$(brew --prefix wxmac)/bin/wx-config --with-odbc=$(brew --prefix unixodbc)" 
export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
export CPPFLAGS="-I$(brew --prefix unixodbc)/include"
export LDFLAGS="-L$(brew --prefix unixodbc)/lib"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
