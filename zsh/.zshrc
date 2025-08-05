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
alias nv=neovide
alias hx=helix
alias cat=bat
alias copy="xclip -sel clip"
alias task="go-task"

# EZA ALIASES
alias ls="eza"
alias l="eza --long --no-time --no-user --git --sort=type"
alias la="l -a"
alias t="eza --tree"
alias tgi="t --git-ignore"

# DOCKER ALIASES
alias dc="docker compose"
alias dcu="docker compose up"
alias dcd="docker compose down"
alias dcl="docker compose logs"
alias dps="docker ps"
alias dpsi="docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.State}}' | tail -n +2 | fzf -m --layout=reverse | awk -F ' ' '{print \$1}'"

dki() {
  selected_containers=$(dpsi)

  IFS=$'\n'
  if  [ -n "$selected_containers" ]; then
	  for i in ${(f)selected_containers}; do
		echo docker kill $i
		docker kill $i
	done
  fi
}

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
alias rfci="fd -a --base-directory /usr/share/doc/rfc/txt | fzf | xargs nvim +ZenMode -"

gli() {
  branch=$1
  selected_commit=$(git log $1 --pretty=format:"%C(auto,yellow)%h%Creset %as %Cblue%an%Creset %s" | fzf --layout=reverse --preview "echo {} | sed -e 's/\s.*//' | xargs git show --name-only" | awk -F' ' '{print $1}')

  if  [ -n "$selected_commit" ]; then
    echo $selected_commit
    echo $selected_commit | tr -d "\n" | xclip -sel clip
  fi
}

gshowi() {
  selected_commit=$(git log $1 --pretty=format:"%C(auto,yellow)%h%Creset %as %Cblue%an%Creset %s" | fzf --layout=reverse --preview "echo {} | sed -e 's/\s.*//' | xargs git show --name-only" | awk -F' ' '{print $1}')

  if  [ -n "$selected_commit" ]; then
    echo $selected_commit
    git show $selected_commit
  fi
}

gci() {
  selected_branch=$(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf --height=30%)

  if  [ -n "$selected_branch" ]; then
    echo $selected_branch
    git checkout $selected_branch
  fi
}

gswi() {
  selected_branch=$(git for-each-ref refs/heads/ --format='%(refname:short)' | fzf --height=30%)

  if  [ -n "$selected_branch" ]; then
    echo $selected_branch
    git switch $selected_branch
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

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ioane/.local/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ioane/.local/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ioane/.local/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ioane/.local/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(direnv hook zsh)"

source /usr/share/nvm/init-nvm.sh

export EZA_COLORS='ex=38;2;120;153;120:fi=38;2;204;204;204:di=38;2;85;85;85:b0=38;2;215;0;0:or=38;2;215;0;0:ln=38;2;112;128;144:lp=38;2;112;128;144:lc=38;2;112;128;144:lm=38;2;112;128;144:bd=38;2;119;136;170:cd=38;2;119;136;170:pi=38;2;119;136;170:so=38;2;119;136;170:ur=38;2;122;122;122:uw=38;2;122;122;122:ux=38;2;122;122;122:ue=38;2;122;122;122:gr=38;2;122;122;122:gw=38;2;122;122;122:gx=38;2;122;122;122:tr=38;2;122;122;122:tw=38;2;122;122;122:tx=38;2;122;122;122:su=38;2;122;122;122:sf=38;2;122;122;122:xa=38;2;122;122;122:hd=38;2;68;68;68:bl=38;2;122;122;122:cc=38;2;122;122;122:da=38;2;122;122;122:in=38;2;122;122;122:xx=38;2;122;122;122:ga=38;2;120;153;120:gd=38;2;255;170;136:gm=38;2;119;136;170:gv=38;2;119;136;170:gt=38;2;119;136;170:df=38;2;122;122;122:ds=38;2;122;122;122:sb=38;2;85;85;85:sn=38;2;170;170;170:uu=38;2;85;85;85:un=38;2;85;85;85:gu=38;2;85;85;85:gn=38;2;85;85;85:sc=38;2;204;204;204:bu=38;2;204;204;204:cm=38;2;122;122;122:tm=38;2;122;122;122:co=38;2;122;122;122:do=38;2;122;122;122:cr=38;2;255;170;136:im=38;2;122;122;122:lo=38;2;122;122;122:mu=38;2;122;122;122:vi=38;2;122;122;122:mp=38;2;122;122;122'
