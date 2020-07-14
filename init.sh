#!/usr/bin/env sh

PKG_INSTALL="yay -S"
PKGES_TO_INSTALL="nodejs yarn git typescript code spotify qbittorrent"

declare -a STEPS=(
    "git"
    "zsh"
    "neofetch"
    "pacman"
    "installApps"
)

GREEN="\033[0;32m"
RED="\033[0;31m"
WHITE="\033[0m"
CYAN="\033[0;36m"

function git() {
    cp gitconfig ~/.gitconfig &&
    cp gitignore_global ~/.gitignore_global
}

function zsh() {
    cp zshrc ~/.zshrc &&
    cp p10k.zsh ~/.p10k.zsh &&
    cp oh-my-zsh-util.zsh ~/.oh-my-zsh/custom/util.zsh
}

function neofetch() {
    cp neofetch.conf ~/.config/neofetch/config.conf
}

function pacman() {
    sudo cp pacman.conf /etc/pacman.conf
}

function installApps() {
    ${PKG_INSTALL} ${PKGES_TO_INSTALL}
}

for script in "${STEPS[@]}"; do
    ${script} && printf "${GREEN}Success: ${WHITE}Executed the ${script} script\n" || printf "${RED}Error: ${WHITE}Failed at the ${script} script\n"
done;

printf "${CYAN}Script finished\n"
exit 0