# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PATH=$HOME/.gem/ruby/2.6.0/bin:$HOME/scripts:$PATH

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files'

ZSH_THEME="custom"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

setopt HIST_IGNORE_SPACE
HISTORY_IGNORE="(cd|ls *)"

plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# fzf shortcuts: Ctrl-r, Ctrl-t, Alt-c
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

# Aliases
alias vim='nvim'
alias svim='sudo -E nvim'
alias resource='source ~/.zshrc'
alias rm='rm -i'
alias jrnl=' jrnl'

# Node version manager
source /usr/share/nvm/init-nvm.sh

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Miniconda
. "$HOME/.miniconda3/etc/profile.d/conda.sh"
