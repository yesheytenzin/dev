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
