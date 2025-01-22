$env.config = {}

$env.EDITOR = "nvim"

use std *
path add ($env.HOME | path join .local/bin) ($env.HOME | path join .bin)

# SHELL PROMPT CONFIG

$env.STARSHIP_SHELL = "nu"

def create_left_prompt [] {
    starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)'
}

# Use nushell functions to define your right and left prompt
$env.PROMPT_COMMAND = { || create_left_prompt }
$env.PROMPT_COMMAND_RIGHT = ""

# The prompt indicators are environmental variables that represent
# the state of the prompt
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR_VI_INSERT = "INSERT "
$env.PROMPT_INDICATOR_VI_NORMAL = "NORMAL "
$env.PROMPT_MULTILINE_INDICATOR = "::: "

alias v = nvim

# GIT ALIASES
alias g = git
alias ga = git add
alias gc = git checkout
alias gs = git status
alias gf = git fetch
alias gl = git log --format='%C(auto)%h %C(blue)%an%C(auto) %s %d'
alias gll = git log --name-only
alias glr = git log --pretty=reference
alias lg = lazygit

def gle [] { git log --format='%C(auto)%h»¦«%C(blue)%an%C(auto)»¦«%s»¦«%d' | lines | split column "»¦«" Commit Author Description Ref | explore }

def gli [branch?] {
    let branch = if $branch != null { $branch } else { git branch --show-current }
    let selected_commit = git log $branch --pretty=format:"%C(auto,yellow)%h%Creset %as %Cblue%an%Creset %s" | fzf --layout=reverse --preview "echo {} | sed -e 's/\\s.*//' | xargs git show --name-only" | awk -F' ' '{print $1}'

    if $selected_commit != "" {
	echo $selected_commit
    }
}

def gci [] {
    let selected_branch = git for-each-ref refs/heads/ --format='%(refname:short)' | fzf --height=30%

    if $selected_branch != "" {
	echo $selected_branch
	git checkout $selected_branch
    }
}

# DOCKER ALIASES
alias dc = docker compose
alias dcu = docker compose up
alias dcd = docker compose down
alias dcl = docker compose logs
alias dps = docker ps

def dpsi [] { docker ps --format 'table {{.ID}}\t{{.Names}}\t{{.State}}' | tail -n +2 | fzf --layout=reverse | awk -F ' ' '{print \$1}' | tr -d '\n' }

