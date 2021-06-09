nvm() {
  unfunction nvm
  . /usr/share/nvm/init-nvm.sh
  nvm "$@"
}

fuck() {
  unfunction fuck
  eval $(thefuck --alias)
  fuck "$@"
}
