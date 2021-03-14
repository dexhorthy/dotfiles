export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster-custom" #ZSH_THEME="random"

DISABLE_LS_COLORS="false"

# COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="yyyy-mm-dd"
plugins=(git zsh-syntax-highlighting history-substring-search-custom kubectl)

# User configuration

export PATH="$HOME/bin:$HOME/.cargo/bin:$HOME/.bin:$HOME/homebrew/bin:$HOME/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/go/bin:/usr/texbin:$HOME/.rvm/bin:$HOME/go/bin:$HOME/.local/bin:$HOME/.yarn/bin"
export PATH="$PATH:$HOME/opt/kubebuilder/bin"
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
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
