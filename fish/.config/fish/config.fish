if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
alias k=kubectl
alias sudo=sudo-rs

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
