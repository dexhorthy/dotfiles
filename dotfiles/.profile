set -o vi
export TERM=xterm-256color
export EDITOR="vim"
source ~/.mark source ~/.venv/bin/activate
source ~/.aliases
source ~/.gpg-ssh-etc

export GREP_COLOR='0;32'
export DOCKER_BUILDKIT=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export CLINT_FORCE_COLOR=1
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin:$HOME/local/bin"
export PATH="$HOME/bin:$PATH"
export NVIM_HOME="$HOME/meta/notes/nvim"
#export POMO_LOG_PATH="$HOME/meta/notes/pomo"
export POMO_LOG_PATH=~/Documents/notes/fzf-vim/pomo.md
export HELM_EXPERIMENTAL_OCI=1
export CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR=1
export MAX_THINKING_TOKENS=25000
export PATH="$PATH:$HOME/.claude/local"

export GOPATH=~/go


. $HOME/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
. $HOME/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# added by Snowflake SnowSQL installer
export PATH=/Users/dex/bin:$PATH
export CLERK_HOST_PATH=$HOME/go/src/github.com/metalytics-dev/clerk-sdk-python

if [[ -f "$HOME/.anthropic" ]]; then
  source "$HOME/.anthropic"
fi
. "$HOME/.cargo/env"

export HUMANLAYER_WORKTREE_OVERRIDE_BASE=~/wt


export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"
