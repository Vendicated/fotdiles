alias vimdiff="nvim -d"
alias vim="nvim"
alias vi="nvim"
alias lolcat="lolcat --truecolor"
alias neofetch="neofetch | lolcat"
alias shutdown="shutdown now"
alias rg="rg --no-ignore --hidden"

sxivremote() { curl -sS "${1:?Please specify an url}" -o /tmp/sxivremote && sxiv /tmp/sxivremote && rm -f /tmp/sxivremote }
