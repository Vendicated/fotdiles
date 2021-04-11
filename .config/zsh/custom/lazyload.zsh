nvm() {
  unfunction nvm
  . /usr/share/nvm/init-nvm.sh
  nvm $@
}
