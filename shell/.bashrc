#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='eza -h'
alias cat='bat --style=full --color=always'
alias grep='grep --color=auto'

alias synctheme='current_wall=$(swww query | grep "image:" | sed "s/.*image: //"); wal -i "$current_wall"'

alias weather='curl wttr.in'

alias battery="upower -i $(upower -e | grep BAT) | awk '/percentage/ {print $NF}'"


synctheme >/dev/null 2>&1
fastfetch

PS1='[\u@\h \W]\$ '
