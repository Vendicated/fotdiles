# My dots

```bash
git clone --recurse-submodules https://github.com/Vendicated/dotfiles $HOME/dotfiles
cd $HOME/dotfiles
# THIS WILL SYMLINK EVERYTHING INSIDE .config and .local/bin TO
# THE RESPECTIVE FOLDERS IN YOUR HOME DIRECTORY. USE WITH CARE
# (does not override existing files)
./installer.sh install 
```
