# Aliases

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                 # classify files in colour
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                              # long list
alias la='ls -A'                              # all but . and ..
alias l='ls -CF'                              #

# Custom
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias tmux='tmux -2 new -As0 -c ~'
alias apt='sudo apt'
alias untar='tar -xvaf'

type exa >/dev/null 2>&1 && alias ls=exa
type batcat >/dev/null 2>&1 && alias cat=batcat
type z >/dev/null 2>&1 && alias cd=z
type nvim >/dev/null 2>&1 && alias vim=nvim
type lvim >/dev/null 2>&1 && alias vim=lvim
type lvim >/dev/null 2>&1 && alias nvim=lvim

alias sway="sway > /home/dan/.sway.log 2>&1"


