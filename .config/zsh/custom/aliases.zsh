alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias lolcat="lolcat --truecolor"
alias neofetch="neofetch | lolcat"
alias shutdown="shutdown now"
alias rg="rg --no-ignore --hidden"

sxivremote() { 
  curl -sS "${1:?Please specify an url}" -o /tmp/sxivremote && 
    sxiv /tmp/sxivremote && 
    rm -f /tmp/sxivremote 
}

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


