#/!usr/bin/env sh

die() {
	echo "$1"
	exit
}

sync_dotfiles() {
	for item in $(ls .config); do
		cp -r ~/.config/"$item" .config/
	done

	git commit -am "Update dotfiles"
	git push
}

install_dotfiles() {
	[ -d .git ] && git pull --quiet

	for item in $(ls .config); do
		cp -r ".config/$item" ~/.config/
	done
}

[ -d .config ] || die ".config directory not found. Make sure you run this from the correct directry"

if [ "$1" == "sync" ]; then
	sync_dotfiles
elif [ "$1" == "install" ]; then
	install_dotfiles
else
	echo "Usage: $0 <install | sync>"
fi
