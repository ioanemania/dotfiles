export ZSH="$HOME/.zsh" export SHELL='/usr/bin/zsh'

export EDITOR=nvim
export VISUAL="neovide --nofork"

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
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%b'

function git_branch_name() {
  if [[ $vcs_info_msg_0_ == "" ]]
  then
    :
  else
    echo '%F{blue}%F{blue}'$vcs_info_msg_0_'%F{green} %f '
  fi
}

PROMPT=' %B%F{yellow}%1~%(!.#.)%b%f $(git_branch_name)'$'\n'' %F{green}$%f '

# Beam shaped cursor
# echo -ne '\e[5 q'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^ ' autosuggest-accept

export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# ALIASES
alias t=tree
alias vim=nvim
alias v=vim
alias ls="exa"
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"

# GIT ALIASES
alias g=git
alias gs="git status"
alias gf="git fetch"
alias gc="git checkout"

# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach -t default || exec tmux new -s default && exit
# fi
