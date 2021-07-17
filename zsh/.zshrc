export ZSH="$HOME/.zsh"
export SHELL='/usr/bin/zsh'

export EDITOR=nvim
export VISUAL=nvim

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory     #Append history to the history file (no overwriting)
setopt sharehistory      #Share history across terminals
setopt incappendhistory  #Immediately append to the history file, not just when a term i

source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/fzf.sh

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
    echo '%F{green}(%F{yellow}'$vcs_info_msg_0_'%F{green})%f '
  fi
}

PROMPT=' %B%F{yellow}%1~%(!.#.)%b%f $(git_branch_name)%F{green}>%f '

export DAY_START=8
export DAY_END=20
# # Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"
    DATE=`date +%H`
    if [[ ($DATE -ge $DAY_START) && ($DATE -lt $DAY_END) ]]; then
      base16_one-light
      export BAT_THEME=OneHalfLight
    else
      base16_onedark
      export BAT_THEME=OneHalfDark
    fi

# Beam shaped cursor
echo -ne '\e[5 q'

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^ ' autosuggest-accept

export M4PATH='.:~/texmf/tex/latex/Circuit_macros:'
export FZF_DEFAULT_COMMAND='fd --type f'
# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_DEFAULT_COMMAND="find -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null"

# ALIASES
alias t=tree
alias vim=nvim
alias v=vim
alias neovide="neovide-disowned"
alias nv=neovide
alias ls="ls --color=auto -h"
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"
alias pandocls='pandoc -r markdown-auto_identifiers -t pdf --template ~/.local/share/latex/pandoc-template.tex --pdf-engine=xelatex --listings '
alias steam="steam -no-browser -console"

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || exec tmux new -s default && exit
fi
