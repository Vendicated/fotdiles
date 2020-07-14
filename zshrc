if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

DISABLE_UPDATE_PROMPT="true"

export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

export EDITOR="nano"

HIST_STAMPS="dd/mm/yyyy"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)


source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source /usr/share/nvm/init-nvm.sh

eval $(thefuck --alias)
