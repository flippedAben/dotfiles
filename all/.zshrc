ZSH_THEME="custom"
HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

# path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR='nvim'
export PATH=$HOME/.gem/ruby/2.6.0/bin:$HOME/scripts:$PATH

plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

# fzf shortcuts: Ctrl-r, Ctrl-t, Alt-c
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files'

# history
setopt HIST_IGNORE_SPACE
setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
HISTORY_IGNORE="(cd|ls *)"

# aliases
alias vim='nvim'
alias svim='sudo -E nvim'
alias resource='source ~/.zshrc'
alias rm='rm -i'
alias jrnl=' jrnl'

## color aliases
alias ip='ip --color=auto'
alias diff='diff --color=auto'

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# miniconda
# . "$HOME/.miniconda3/etc/profile.d/conda.sh"

# nvm
export PATH=~/.nvm/versions/node/v16.13.0/bin:$PATH
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
