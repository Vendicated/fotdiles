alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias lolcat="lolcat --truecolor"
alias shutdown="shutdown now"
alias rg="rg --no-ignore --hidden"
alias yay="echo 'USE PARU IDIOT' && paru"
alias pin="paru -S"
alias pun="paru -Rns"
alias pup="paru -Syu"
alias src="source $HOME/.zshrc"

owo() {
  local output=$(command owo $*)
  if [ $? -eq 0 ] && [ -n "$output" ]; then
    xclip -selection clipboard <<< "$output" && \
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


