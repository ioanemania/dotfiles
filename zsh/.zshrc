export ZSH="$HOME/.zsh" export SHELL='/usr/bin/zsh'
export PATH="$PATH:$HOME/.local/bin:$HOME/.bin"

export EDITOR=nvim
export LC_TIME="en_US.UTF-8"
export BAT_THEME="OneHalfDark"
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

# DOCKER ALIASES
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcl="docker compose logs"
alias dps="docker ps"

# GIT ALIASES
alias g=git
alias ga="git add"
alias gc="git checkout"
alias gs="git status"
alias gf="git fetch"
alias gl="git log --format='%C(auto)%h %C(blue)%an%C(auto) %s %d'"
alias gll="git log --name-only"
alias glr="git log --pretty=reference"
alias lg="lazygit"

gli() {
  branch=$1
  selected_commit=$(git log $1 --pretty=format:"%C(auto,yellow)%h%Creset %as %Cblue%an%Creset %s" | fzf --layout=reverse --preview "echo {} | sed -e 's/\s.*//' | xargs git show --name-only" | awk -F' ' '{print $1}')

  if  [ -n "$selected_commit" ]; then
    echo $selected_commit
    echo $selected_commit | tr -d "\n" | xclip -sel clip
  fi
}

gci() {
  selected_branch=$(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf --height=30%)

  if  [ -n "$selected_branch" ]; then
    echo $selected_branch
    git checkout $selected_branch
  fi
}

gai() {
  selected_files=$(git status --porcelain | awk -F' ' '{print $2}' | fzf -m --height=30%)

  if  [ -n "$selected_files" ]; then
    echo $selected_files
    git add $selected_files
  fi

  git status
}

load_env() {
  local envFile="${1?Missing environment file}"
  local environmentAsArray variableDeclaration
  mapfile environmentAsArray < <(
    grep --invert-match '^#' "${envFile}" \
      | grep --invert-match '^\s*$'
  ) # Uses grep to remove commented and blank lines
  for variableDeclaration in "${environmentAsArray[@]}"; do
    export "${variableDeclaration//[$'\r\n']}" # The substitution removes the line breaks
  done
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
