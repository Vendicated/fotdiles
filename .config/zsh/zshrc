if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"
HIST_STAMPS="dd/mm/yyyy"
DISABLE_UPDATE_PROMPT="true"

export ZSH=$HOME/.oh-my-zsh
export ZSH_CUSTOM=$HOME/.config/zsh/custom

export PATH=$HOME/.local/bin:$PATH
export EDITOR=nvim
export TERMINAL=st
export BROWSER=firefox

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# Vi Mode
# bindkey -v
# Setting vi mode resets keybinds so source them again (sourcing zsh after setting vi mode resets to emacs mode)
# source $ZSH_CUSTOM/keybinds.zsh

# Disable ls background colors
eval "$(dircolors -p | sed 's/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /' | dircolors /dev/stdin)"
