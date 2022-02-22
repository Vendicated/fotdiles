#!/usr/bin/zsh
alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias rmrf="rm -rf"
alias lolcat="lolcat --truecolor"
alias shutdown="shutdown now"
alias rg="rg --hidden -i"
alias rgf="rg --files | rg --hidden -i"
alias yay="echo 'USE PARU IDIOT' && paru"
alias pin="paru -S"
alias pun="paru -Rns"
alias pup="paru -Syu"
alias KYSPYTHON="paru -Syu --overwrite *"
alias py="python3"
alias webcam="mpv av://v4l2:/dev/video0 --profile=low-latency --untimed"
alias jadxdef="jadx --show-bad-code --threads-count 4 --no-replace-consts --no-inline-anonymous --no-generate-kotlin-metadata"
b64() { base64 <<< "$*" }
alias b64d="base64 -d <<<"
# guhhhh TERM=alacritty makes ssh weird
alias ssh="TERM=xterm-256color ssh"

cpp_eval() {
  src=$(mktemp /tmp/cpptemp.XXXXXXXX.cpp)
  out=$(mktemp)
  tee $src >/dev/null
  g++ $src -o $out
  $out
}

adb() {
  # try to connect if no device connected
  [ $(command adb devices | wc -l) -gt 2 ] || command adb connect $ANDROID_IP
  command adb "$@"
}

ghc() { git clone "git@github.com:${1:?gib user retard}/${2:?Gib repo retard}" $3 }

mkcd() {
  mkdir "$1" && cd "$1"
}

ctxgrep() {
  i="${2:-10}"
  rg -o ".{0,$i}${1:?You didnt give me anything to grep for lol}.{0,$i}"
}

owo() {
  local output=$(command owo $*)
  if [ $? -eq 0 ] && [ -n "$output" ]; then
    toclip <<< "$output" && \
      notify-send -i $HOME/.local/share/icons/owo.png "OwO" "Copied url to clipboard!"
  fi
}

wal() {
  command wal $* && cp $HOME/.cache/wal/walcord.theme.css $HOME/.var/app/com.discordapp.Discord/config/BetterDiscord/themes
}

cowsay() {
  local cow="$(command cowsay -l | sed -e "1d" -e "s/\s/\n/g" | shuf -n 1)"
  command cowsay -f "$cow" $*
}

sxivremote() { 
  curl -sS "${1:?Please specify an url}" -o /tmp/sxivremote && 
    sxiv /tmp/sxivremote && 
    rm -f /tmp/sxivremote 
}

# uwu() {
#   trap "CANCELUWU=1" SIGINT
#   while [ -z $CANCELUWU ]; do
#     echo -ne "\r\033[0KUwU" | lolcat 2> /dev/null || break
#     sleep .05
#   done
#   
#   echo -e "\r\033[0KUwU" | lolcat 2> /dev/null
#   unset CANCELUWU
# }

codi() {
  local syntax="${1:-javascript}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}


