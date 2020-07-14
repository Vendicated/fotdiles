# Aliases

alias pin="yay -S"
alias prm="yay -Rs"


# Functions

function cd() {
 if [ -z "$1" ]; then
	builtin cd ~;
 elif [ -d "$1" ]; then
	builtin cd "$1";
 else
	mkdir "$1";
	echo "Creating dir $1...";
	builtin cd "$1";
 fi
}
