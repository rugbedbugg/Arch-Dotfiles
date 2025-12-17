#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# DEFAULT ALIASES
alias ls='eza -h'
alias cat='bat --style=full --color=always'
alias grep='grep --color=auto'
alias cp='rsync -avh --info=progress2'

# COLORSCHEME MAINTAINER (WALLPAPER + PROMPT)
function synctheme {
    # Get current wallpaper from swww
    local current_wall=$(swww query | grep "image:" | sed "s/.*image: //")
    
    # Generate pywal colors quietly
    wal -i "$current_wall" -q
    
    # Source pywal colors
    if [ -f ~/.cache/wal/colors.sh ]; then
        source ~/.cache/wal/colors.sh
    fi

    # Convert hex to RGB
    hex_to_rgb() {
        local hex=$1
        printf "%d %d %d\n" $((16#${hex:1:2})) $((16#${hex:3:2})) $((16#${hex:5:2}))
    }

    # Update Bash prompt with pywal colors
    read USER_R USER_G USER_B <<< $(hex_to_rgb "$color2")
    read HOST_R HOST_G HOST_B <<< $(hex_to_rgb "$color4")
    read DIR_R DIR_G DIR_B <<< $(hex_to_rgb "$color6")

    # Set PS1 with true color
    PS1="\[\e[38;2;${USER_R};${USER_G};${USER_B}m\]\u\[\e[0m\]@\[\e[38;2;${HOST_R};${HOST_G};${HOST_B}m\]\h\[\e[0m\] [\[\e[38;2;${DIR_R};${DIR_G};${DIR_B}m\]\W\[\e[0m\]]>> "
}

# INFO DISPLAY
alias weather='curl wttr.in'
alias battery="upower -i $(upower -e | grep BAT) | awk '/percentage/ {print $NF}'"

# LOCAL AI ASSISTANT
alias mayday='echo "Establishing secure connection with Actual..." && echo "Actual copies all." && ollama run Oxide-Actual'
alias rugout='pkill ollama && echo "Actual copies all." && echo "Actual out."'


# EASY EXTRACT
# USAGE: extract "filename"
function extract {
    # display usage if no parameters given
    [[ $# -eq 0 ]] && { echo "Usage: extract path/file.ext [path/file0.ext]"; return 1; }
    
    for n in "$@"; do
        [[ ! -f "$n" ]] && { echo "'$n' - file doesn't exist"; return 1; }

        case "${n%,}" in
          *.cbt|*.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) tar zxvf "$n" ;;
          *.lzma)      unlzma ./"$n"      ;;
          *.bz2)       bunzip2 ./"$n"     ;;
          *.cbr|*.rar) unrar x -ad ./"$n" ;;
          *.gz)        gunzip ./"$n"      ;;
          *.cbz|*.epub|*.zip) unzip ./"$n";;
          *.z)         uncompress ./"$n"  ;;
          *.7z|*.apk|*.arj|*.cab|*.cb7|*.chm|*.deb|*.iso|*.lzh|*.msi|*.pkg|*.rpm|*.udf|*.wim|*.xar|*.vhd) 7z x ./"$n" ;;
          *.xz)        unxz ./"$n"        ;;
          *.exe)       cabextract ./"$n"  ;;
          *.cpio)      cpio -id < ./"$n"  ;;
          *.cba|*.ace) unace x ./"$n"     ;;
          *.zpaq)      zpaq x ./"$n"      ;;
          *.arc)       arc e ./"$n"       ;;
          *.cso)       ciso 0 ./"$n" ./"$n.iso" && extract "$n.iso" && \rm -f "$n" ;;
          *.zlib)      zlib-flate -uncompress < ./"$n" > ./"$n.tmp" && mv ./"$n.tmp" ./"${n%.*zlib}" && rm -f "$n"   ;;
          *.dmg)       hdiutil mount ./"$n" -mountpoint "./$n.mounted" ;;
          *.tar.zst)   tar -I zstd -xvf ./"$n"  ;;
          *.zst)       zstd -d ./"$n"  ;;
          *)           echo "extract: '$n' - unknown archive method"; return 1 ;;
        esac
    done
}

# INITIALIZE THEME + PROMPT
synctheme

# System info
fastfetch

