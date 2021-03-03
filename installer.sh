#/!usr/bin/env sh

die() {
	echo "$1"
	exit
}

# Usage: SourceDirectory TargetDirectory
link_all() {
	for file in $(ls "$1"); do
		ln -s "$1/$file" "$2/$file"
	done
}

install_dotfiles() {
	git pull --quiet

	mkdir -p "$HOME/.config"
	mkdir -p "$HOME/.local/bin"

	link_all "$PWD/.config" "$HOME/.config"
	link_all "$PWD/.local/bin" "$HOME/.local/bin"
}

[ -d .git ] || die ".git directory not found. Make sure you run this from the correct directry"
[ -d .config ] || die ".config directory not found. Make sure you run this from the correct directory"
[ -d .local/bin ] || die ".local/bin directory not found. Make sure you run this from the correct directory"

if [ "$1" == "install" ]; then
	install_dotfiles
else
	echo "Tool to symlink everything inside .config and .local/bin"
	echo "to respective folder in $HOME"
	echo
	echo "Usage: $0 <install | help>"
fi
