#!/usr/bin/env sh

# NodeJs 15.x
echo "Setting up NodeJs 15.x"
curl -sL https://deb.nodesource.com/setup_15.x | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 bash - > /dev/null 

# Yarn
echo "Setting up Yarn"
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 apt-key add - > /dev/null
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list > /dev/null

packages="zsh yarn neovim python3 python python3-pip jq youtube-dl ffmpeg build-essential"

echo "Installing $packages"
DEBIAN_FRONTEND=noninteractive apt-get -qq install $packages > /dev/null && echo "All done!" || exit 1

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null

echo "Installing Powerlevel10k"
echo "Remember to install the Powerlevel10k fonts: https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k > /dev/null

echo "Installing zsh-syntax-highlighting and zsh-autosuggestions plugin"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting > /dev/null
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null

echo "Installing owo.sh"
git clone https://owo.codes/whats-this/owo.sh.git owo.sh > /dev/null
cd owo.sh
git checkout 1.0.0 > /dev/null
make install > /dev/null
cd ..
rm -rf owo.sh

echo "All done!"
