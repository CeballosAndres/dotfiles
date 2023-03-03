# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Configurations for specific SO

case "$OSTYPE" in
  darwin*)
    # Auto completions for brew
    chmod -R go-w "$(brew --prefix)/share"
    if type brew &>/dev/null
    then
      FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
      autoload -Uz compinit
      compinit
    fi
    # asdf variables to compile
    # ! comented bc a warning related whit xwmax 
    . /opt/homebrew/opt/asdf/libexec/asdf.sh
    export CFLAGS="-O2 -g -fno-stack-check"
    #export KERL_CONFIGURE_OPTIONS="--disable-hipe --with-ssl=$(brew --prefix openssl@1.1) --with-wx-config=$(brew --prefix wxmac)/bin/wx-config --with-odbc=$(brew --prefix unixodbc)" 
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
    export CPPFLAGS="-I$(brew --prefix unixodbc)/include"
    export LDFLAGS="-L$(brew --prefix unixodbc)/lib"

    # For secrets
    source ~/.keychain-environment-variables.sh

    # AWS configuration example, after doing:
    # $  set-keychain-environment-variable AWS_ACCESS_KEY_ID
    #       provide: "AKIAYOURACCESSKEY"
    # $  set-keychain-environment-variable AWS_SECRET_ACCESS_KEY
    #       provide: "j1/yoursupersecret/password"
    export GITLAB_TOKEN_CFS=$(keychain-environment-variable GITLAB_TOKEN_CFS);
  ;;
  linux*)

  ;;
esac



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
  wakatime
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
source <(lab completion zsh)

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
alias sw-remote='git remote rename origin temp && git remote rename upstream origin && git remote rename temp upstream&&git remote -v'

echo -e "\033Ptmux;\033\033\033]50;SetProfile=dark-theme\a\e\\"

bindkey '^ ' autosuggest-accept

# gitlab
git-fork(){
   lab clone "$2"
   cd "$3"
   lab fork -g "$1" -r upstream
   git remote rename origin temp && git remote rename upstream origin && git remote rename temp upstream && git remote -v
   git submodule update --init --recursive
   gco-sub() "$4"
}

gco-sub(){
   git checkout "$1" --
   cd core
   if [[ "$1" == "testing" ]]; then
      git checkout 2_0_testing
   else
      git checkout 2_0_master
   fi
   cd ../helpers
   git checkout "$1" --
   cd ../models
   git checkout "$1" --
   cd ../json_models
   git checkout "$1" --
   cd ../messages
   git checkout "$1" --
   cd ..
}


#---------------------------------------------- chpwd pyvenv ---
python_venv() {
  MYVENV=./env
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
