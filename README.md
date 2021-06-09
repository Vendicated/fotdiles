# My dots

```bash
git clone --recurse-submodules git@github.com:Vendicated/fotdiles.git
cd dotfiles

# Install all packages
paru -S --needed - < pkglist.txt

# Deploy dotfiles
./installer.sh install

###

# Install binaries
git clone git@github.com:Vendicated/rust_bin.git
cd rust_bin
./install.sh
```
