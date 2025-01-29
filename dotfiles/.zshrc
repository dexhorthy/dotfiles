export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster-custom" #ZSH_THEME="random"

DISABLE_LS_COLORS="false"

# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"
plugins=(zsh-syntax-highlighting history-substring-search-custom kubectl)

# User configuration

export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.bin:$HOME/.bin/baml/:$HOME/homebrew/bin:$HOME/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/usr/texbin:$HOME/.rvm/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/opt/kubebuilder/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH="$PATH:$HOME/opt/aws-cli"
export FPATH="$HOME/homebrew/share/zsh/site-functions/:$FPATH"

autoload -U zmv

. $ZSH/oh-my-zsh.sh

# vi mode for history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# add custom functions
fpath=(~/.oh-my-zsh/custom/functions $fpath)

. ~/.zsh_completions

. ~/.profile
show_colors
alias k=kubectl
complete -F __start_kubectl k


# added by Snowflake SnowSQL installer v1.2
export PATH=/Applications/SnowSQL.app/Contents/MacOS:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/dex/.bun/_bun" ] && source "/Users/dex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Added by Windsurf
export PATH="/Users/dex/.codeium/windsurf/bin:$PATH"
