#
# ~/.bashrc
#

set -o vi

alias ls="exa -a --icons --group-directories-first"
alias lsd="exa -al --icons --group-directories-first"
alias lst="exa -aT -L 5 --icons --group-directories-first"
alias lsta="exa -aT --icons --group-directories-first"


eval "$(starship init bash)"
