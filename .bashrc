
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
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases

if [ -f "${HOME}/.bash_aliases" ]; then
  source "${HOME}/.bash_aliases"
fi

# Functions
#
# a) function settitle
settitle ()
{
  echo -ne "\e]2;$@\a\e]1;$@\a";
}

# b) function cd_func
# This function defines a 'cd' replacement function capable of keeping,
# displaying and accessing history of visited directories, up to 10 entries.
# To use it, uncomment it, source this file and try 'cd --'.
# acd_func 1.0.5, 10-nov-2004
# Petar Marinov, http:/geocities.com/h2428, this is public domain
# cd_func ()
# {
#   local x2 the_new_dir adir index
#   local -i cnt
#
#   if [[ $1 ==  "--" ]]; then
#     dirs -v
#     return 0
#   fi
#
#   the_new_dir=$1
#   [[ -z $1 ]] && the_new_dir=$HOME
#
#   if [[ ${the_new_dir:0:1} == '-' ]]; then
#     #
#     # Extract dir N from dirs
#     index=${the_new_dir:1}
#     [[ -z $index ]] && index=1
#     adir=$(dirs +$index)
#     [[ -z $adir ]] && return 1
#     the_new_dir=$adir
#   fi
#
#   #
#   # '~' has to be substituted by ${HOME}
#   [[ ${the_new_dir:0:1} == '~' ]] && the_new_dir="${HOME}${the_new_dir:1}"
#
#   #
#   # Now change to the new dir and add to the top of the stack
#   pushd "${the_new_dir}" > /dev/null
#   [[ $? -ne 0 ]] && return 1
#   the_new_dir=$(pwd)
#
#   #
#   # Trim down everything beyond 11th entry
#   popd -n +11 2>/dev/null 1>/dev/null
#
#   #
#   # Remove any other occurence of this dir, skipping the top of the stack
#   for ((cnt=1; cnt <= 10; cnt++)); do
#     x2=$(dirs +${cnt} 2>/dev/null)
#     [[ $? -ne 0 ]] && return 0
#     [[ ${x2:0:1} == '~' ]] && x2="${HOME}${x2:1}"
#     if [[ "${x2}" == "${the_new_dir}" ]]; then
#       popd -n +$cnt 2>/dev/null 1>/dev/null
#       cnt=cnt-1
#     fi
#   done
#
#   return 0
# }
#
# alias cd=cd_func

source ~/.git-prompt.sh
export PS1='[\w$(__git_ps1 " (%s)")]\$ '
# export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.8/lib-dynload/

CONDAPATH="/c/Users/dan/Anaconda3"
export PATH="$CONDAPATH:$PATH"
export PATH="$CONDAPATH/Library/mingw-w64/bin:$PATH"
export PATH="$CONDAPATH/Library/usr/bin:$PATH"
export PATH="$CONDAPATH/Library/bin:$PATH"
export PATH="$CONDAPATH/Scripts:$PATH"
export PATH="$CONDAPATH/bin:$PATH"
export PATH="$CONDAPATH/condabin:$PATH"
export PYTHONPATH=$PYTHONPATH:$CONDAPATH/envs/env3/DLLs

# export PATH="/c/Program Files (x86)/Common Files/Oracle/Java/javapath:$PATH"
# export PATH="/c/WINDOWS/system32:$PATH"
# export PATH="/c/WINDOWS:$PATH"
# export PATH="/c/WINDOWS/System32/Wbem:$PATH"
# export PATH="/c/WINDOWS/System32/WindowsPowerShell/v1.0:$PATH"
# export PATH="/c/WINDOWS/System32/OpenSSH:$PATH"
# export PATH="/c/Program Files/Microsoft VS Code/bin:$PATH"
# export PATH="/c/Users/dan/AppData/Local/Microsoft/WindowsApps:$PATH"
# export PATH="/c/Users/dan/AppData/Local/Programs/Git/cmd:$PATH"
