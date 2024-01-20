export ZSH="$HOME/.zsh" export SHELL='/usr/bin/zsh'
export PATH="$PATH:$HOME/.local/bin:$HOME/.bin"

export EDITOR=nvim
export LC_TIME="en_US.UTF-8"
export BAT_THEME="Catppuccin-frappe"
export VPN="$HOME/.vpn"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term i


source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh

function zvm_after_init() {
  source /usr/share/fzf/key-bindings.zsh
}

source $HOME/.zsh-vi-mode/zsh-vi-mode.plugin.zsh

# Completion
autoload -Uz compinit && compinit

# Beam shaped cursor
# echo -ne '\e[5 q'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^ ' autosuggest-accept

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALIASES
alias vim=nvim
alias v=vim
alias neovide="neovide --frame none --multigrid"
alias nv=neovide
alias hx=helix
alias ls="eza"
alias l="ls -l"
alias la="l -a"
alias t="eza --tree"
alias tgi="t --git-ignore"
alias cat=bat

# GIT ALIASES
alias g=git
alias gs="git status"
alias gf="git fetch"
alias gl="git log --oneline"
alias gll="git log"

gc() {
  git checkout $(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf)
}

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach -t default || exec tmux new -s default && exit
# fi

eval "$(starship init zsh)"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# opam configuration
[[ ! -r /home/ioane/.opam/opam-init/init.zsh ]] || source /home/ioane/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
