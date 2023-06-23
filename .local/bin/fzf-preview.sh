#!/bin/bash

# fzf-preview.sh: fzf preview for various file types.
#
# Used in fzf config (.zshrc) as follows:
# export FZF_CTRL_T_OPTS=" --preview '~/path/to/fzf-preview.sh {}'"
#

file="$1"

if [[ -d "${file}" ]]; then
    ls -al --color "${file}"
elif [[ $(file --mime "${file}") =~ binary ]]; then
    if [[ $(file --mime "${file}") =~ "image/" ]]; then
        columns=$(tput cols)
        columns=$((columns / 2))
        catimg -w ${columns} "${file}"
    else
        fileinfo=$(file "${file}")
        echo "${fileinfo}" && false
    fi
else
    bat --style=numbers --color=always "${file}" 2> /dev/null | head -100
fi
