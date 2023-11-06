# __/\\\\\\\\\\\\\\\_____/\\\\\\\\\\\____/\\\________/\\\____/\\\\\\\\\____________/\\\\\\\\\_
# _\////////////\\\____/\\\/////////\\\_\/\\\_______\/\\\__/\\\///////\\\_______/\\\////////__
# ___________/\\\/____\//\\\______\///__\/\\\_______\/\\\_\/\\\_____\/\\\_____/\\\/___________
#  _________/\\\/_______\////\\\_________\/\\\\\\\\\\\\\\\_\/\\\\\\\\\\\/_____/\\\_____________
#   _______/\\\/____________\////\\\______\/\\\/////////\\\_\/\\\//////\\\____\/\\\_____________
#    _____/\\\/_________________\////\\\___\/\\\_______\/\\\_\/\\\____\//\\\___\//\\\____________
#     ___/\\\/____________/\\\______\//\\\__\/\\\_______\/\\\_\/\\\_____\//\\\___\///\\\__________
#      __/\\\\\\\\\\\\\\\_\///\\\\\\\\\\\/___\/\\\_______\/\\\_\/\\\______\//\\\____\////\\\\\\\\\_
#       _\///////////////____\///////////_____\///________\///__\///________\///________\/////////_
# source ~/Repositories/antigen/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle heroku
# antigen bundle pip
# antigen bundle lein
# antigen bundle command-not-found

# Syntax highlighting bundle.
# antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
# antigen theme nanotech

# Tell Antigen that you're done.
# antigen apply

# Editor
export EDITOR=nvim

# Path to script folder
export PATH="$PATH:$HOME/scripts"

# Prompt Setting
PROMPT='%F{green}%2c%F{blue} [%f '
RPROMPT='%F{blue}]%F{white}($(git_current_branch)) %F{green}%D{%L:%M} %F{yellow}%D{%p}%f'
setopt prompt_subst

# VI keys
set -o vi

# History but better
function hfind() {
    # check if we passed any parameters
    if [ -z "$*" ]; then
        # if no parameters were passed print entire history
        history 1
    else
        # if words were passed use it as a search
        history 1 | egrep --color=auto "$@"
    fi
}

# FBN specific
[ -s "$HOME/.fbnrc" ] && \. "$HOME/.fbnrc"

# Aliases
[ -s "$HOME/.aliases" ] && \. "$HOME/.aliases"

# Functions
[ -s "$HOME/.functions" ] && \. "$HOME/.functions"

# Directory Stack
setopt autopushd

# Append to History
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
export HISTFILESIZE=100000

# Tired of typing all the shit for tmux config
export TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"

source "$HOME/.docker/init-zsh.sh" || true # Added by Docker Desktop
