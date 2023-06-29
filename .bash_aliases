#!/bin/bash

### cd ###
## Prints the new directory after cd'ing.
cd () { 
    command cd "$@" && p;
}
alias c="cd"
alias '..'='c ..'
alias '...'='c ../..'

### pwd ###
# - replace $HOME with ~
# - make everything before the last '/' green, and everything after white and bold
# - alias to p
alias pwd="pwd | sed 's:$HOME:~:' | sed -E 's:(.*/)([^/]+):\x1b[32m\1\x1b[0m\x1b[1m\2\x1b[0m:'"
alias p="pwd"

### rm ###
# adds a '-r' flag only if there is a single argument and that argument
# is a directory.
# This is because I want the behavior of -I (interactive) to be the default,
# but I also want to have the -r flag available when I need it without being
# prompted for single files.
function rm () { 
  if [ $# -eq 1 ] && [ -d "$1" ]; then
    rm --verbose --interactive=once --recursive "$1";
  else
    rm --verbose --interactive=once "$@";
  fi;
}

alias cp='cp --recursive --interactive --verbose --reflink=always'
alias mv='mv --interactive --verbose'

# Default to human readable figures
alias df='df -h'
alias du='du -had1|sort -h'

alias less='less -r'                          # raw control characters
alias where='type -a'                         # where, of a sort
alias which='type -a'                         # where, of a sort
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

alias ls='ls -h --group-directories-first --color=auto'
alias ll='exa -l --group-directories-first'
alias la='exa -group-directories-first -a -a'
alias lla='ll -a -a'
alias lt='ll -s=modified'
alias tree='ll --tree'


alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tmux='tmux -2 new -As0 -c ~'
alias apt='sudo apt'
alias untar='tar -xvaf'


type batcat >/dev/null 2>&1 && alias cat=batcat
# type zoxide >/dev/null 2>&1 && alias cd=zoxide
type nvim >/dev/null 2>&1 && alias vim=nvim
type lvim >/dev/null 2>&1 && alias vi=lvim
type lvim >/dev/null 2>&1 && alias vim=lvim
type lvim >/dev/null 2>&1 && alias nvim=lvim

# alias sway="sway > /home/dan/.sway.log 2>&1"
#
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
