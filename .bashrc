
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
export PATH="~/.local/python-3.9.0-embed-amd64:$PATH"
export PATH="~/.local/python-3.9.0-embed-amd64/Scripts:$PATH"
export PATH="$PATH:/e/Program Files/Teradata/Client/14.10/ODBC Driver for Teradata nt-x8664/Lib:/e/Program Files/Teradata/Client/14.10/bin"
export PATH="$PATH:/e/Program Files/SASHome/SASFoundation/9.4"


# export PATH="/e/oracle64/product/11.2.0.4/client_1/bin:/c/Windows/system32:/c/Windows:/c/Windows/SysWOW64:/c/Windows/System32/Wbem:/c/Windows/Windows/SysWOW64/Wbem:/c/Windows/System32/WindowsPowerShell/v1.0/:/c/Windows/SysWOW64/WindowsPowerShell/v1.0:/c/Program Files/Microsoft Network Monitor 3/:/c/Program Files/HP/HP BTO Software/bin:/c/Program Files/HP/HP BTO Software/bin/win64:/c/Program Files/HP/HP BTO Software/lib:/c/Program Files/HP/HP BTO Software/bin/win64/OpC:/e/Oracle/:/e/Oracle/bin:/e/Program Files/Sybase/shared/Sybase Central 6.1.0/win64:/e/Program Files/Sybase/IQ-15_4/Bin32:/e/Program Files/Sybase/IQ-15_4/Bin64:/e/Program Files/Teradata/Client/14.10/ODBC Driver for Teradata nt-x8664/Lib:/e/Program Files/Teradata/Client/14.10/bin:/e/Program Files/IBM/SQLLIB/BIN:/e/Program Files/IBM/SQLLIB/FUNCTION:/e/Program Files/IBM/SQLLIB/SAMPLES/REPL:/e/Program Files/IBM/Client Access/Emulator:/e/Program Files/IBM/Client Access/Shared:/e/Program Files/IBM/Client Access/:/e/Program Files/TortoiseSVN/bin:/e/Program Files/CollabNet/Subversion Client:/e/Program Files/SASHome/x86/Secure/ccme4:/e/Program Files/SASHome/Secure/ccme4:/c/opscode/chef/bin:$PATH"
