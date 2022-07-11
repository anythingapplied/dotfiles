if [ -d "$HOME/bin" ] ; then
	  export PATH="$PATH:$HOME/bin"
fi
if [ -d "$HOME/.local/bin" ] ; then
	  export PATH="$PATH:$HOME/.local/bin"
fi
if [ -d "$HOME/.poetry/bin" ] ; then
	  export PATH="$PATH:$HOME/.poetry/bin"
fi

# Make bash append rather than overwrite the history on disk
shopt -s histappend

# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
# shopt -s cdspell

# Completion options
#
# These completion tuning parameters change the default behavior of bash_completion:
#
# Define to access remotely checked-out files over passwordless ssh for CVS
# COMP_CVS_REMOTE=1
#
# Define to avoid stripping description in --option=description of './configure --help'
# COMP_CONFIGURE_HINTS=1
#
# Define to avoid flattening internal contents of tar files
# COMP_TAR_INTERNAL_PATHS=1
#
# Uncomment to turn on programmable completion enhancements.
# Any completions you add in ~/.bash_completion are sourced last.
[[ -f /etc/bash_completion ]] && . /etc/bash_completion

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups

export HISTSIZE=10000
export HISTFILESIZE=10000
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases

if [ -f "$HOME/.bash_aliases" ]; then
  source "$HOME/.bash_aliases"
fi

eval "$(starship init bash)"

export EDITOR=/home/dan/.local/bin/lvim
export VISUAL=/home/dan/.local/bin/lvim

source /usr/share/doc/fzf/examples/key-bindings.bash
