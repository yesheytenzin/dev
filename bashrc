# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap
source "$OMARCHY_PATH/default/bash/rc"

# Shared Bash history across terminals, tmux, Herdr, etc.
HISTFILE="$HOME/.bash_history"
HISTSIZE=100000
HISTFILESIZE=200000

# Append instead of overwriting history
shopt -s histappend

# Before every prompt:
# 1. append this shell's new commands
# 2. read commands added by other shells
PROMPT_COMMAND="history -a; history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias academy='cd selise/l3-rails-sunrise-academy'
alias nv='nvim'
alias sah_d1_run='gh workflow run 279289480 --ref release/dev1 --field server=server1'
alias sah_d1_ch='gh run list --workflow 279289480 --branch release/dev1 --limit=5'
alias gitdecorate='git log --oneline -9 --decorate'
alias gitgraph='git log --oneline --graph -9'
alias so='source .bashrc'
alias gitconflict="git grep -n -E '^(<<<<<<<|=======|>>>>>>>)'"
alias gadd='git add .'
alias gcom='git commit -m'
alias gpsh='git push'
alias gpull='git pull'
alias gfsh='git fetch'
alias gresto='git restore .'
alias gcls='git clean -fd'
alias gstat='git status'


# >>> grok installer >>>
export PATH="$HOME/.grok/bin:$PATH"
[[ -r "$HOME/.grok/completions/bash/grok.bash" ]] && source "$HOME/.grok/completions/bash/grok.bash"
# <<< grok installer <<<
export PATH="$HOME/.config/composer/vendor/bin:$PATH"

# ── robbyrussell theme for bash (ported from oh-my-zsh) ──
# faithful port of:
#   PROMPT="%(?:%{$fg_bold[green]%}%1{➜%} :%{$fg_bold[red]%}%1{➜%} ) %{$fg[cyan]%}%c%{$reset_color%}"
#   PROMPT+=' $(git_prompt_info)'
#   ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
#   ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#   ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
#   ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Disable starship prompt (robbyrussell replaces it)
if declare -F starship_precmd &>/dev/null; then
  unset -f starship_precmd
fi
# Remove starship from PROMPT_COMMAND if present
PROMPT_COMMAND="${PROMPT_COMMAND//starship_precmd;/}"
PROMPT_COMMAND="${PROMPT_COMMAND//; starship_precmd/}"
PROMPT_COMMAND="${PROMPT_COMMAND//starship_precmd/}"

# git prompt - mirrors ZSH git_prompt_info
git_prompt_info() {
  # exit if not in git repo
  git rev-parse --is-inside-work-tree &>/dev/null || return
  local branch
  branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null) || return
  # check for dirty (modified / staged / untracked)
  local dirty
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    dirty=1
  fi
  # colors wrapped in \[ \] so bash counts prompt length correctly
  # PREFIX = bold_blue "git:(" + red branch
  # SUFFIX / CLEAN / DIRTY handle closing ) and ✗
  local prefix="\[\e[1;34m\]git:(\[\e[0;31m\]"
  local suffix="\[\e[0m\] "
  local clean="\[\e[0;34m\])"
  local dirty_mark="\[\e[0;34m\]) \[\e[1;33m\]✗"
  if [[ -n $dirty ]]; then
    echo -e "${prefix}${branch}${dirty_mark}${suffix}"
  else
    echo -e "${prefix}${branch}${clean}${suffix}"
  fi
}

__robbyrussell_set_ps1() {
  local ret=$?
  local arrow
  if [[ $ret -eq 0 ]]; then
    arrow="\[\e[1;32m\]➜\[\e[0m\]"
  else
    arrow="\[\e[1;31m\]➜\[\e[0m\]"
  fi
  local cyan="\[\e[0;36m\]"
  local reset="\[\e[0m\]"
  local git_info
  git_info=$(git_prompt_info)
  # %c = basename of pwd -> \W in bash, original has: "➜ cyan %c reset git_info"
  PS1="${arrow} ${cyan}\W${reset} ${git_info}"
  # If you want a trailing $ like classic bash, use:
  # PS1="${arrow} ${cyan}\W${reset} ${git_info}\$ "
}

# Preserve history sharing + set our prompt each time
PROMPT_COMMAND="history -a; history -n; __robbyrussell_set_ps1"
