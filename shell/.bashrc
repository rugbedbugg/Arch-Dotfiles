#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# DEFAULT ALIASES
alias ls='eza -h'
alias cat='bat --style=full --color=always'
alias grep='grep --color=auto'

# COLORSCHEME MAINTAINER (WAYPAPER)
alias synctheme='current_wall=$(swww query | grep "image:" | sed "s/.*image: //"); wal -i "$current_wall" -q; '

# INFO DISPLAY
alias weather='curl wttr.in'
alias battery="upower -i $(upower -e | grep BAT) | awk '/percentage/ {print $NF}'"

# LOCAL AI ASSISTANT
alias mayday='echo "Establishing secure connection with Actual..." && echo "Actual copies all." && ollama run Oxide-Actual'
alias rugout='pkill ollama && echo "Actual copies all." && echo "Actual out."'


synctheme
fastfetch

PS1='[\u@\h \W]\$ '
