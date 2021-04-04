# After Install

Uncomment wheel sudo

```bash
EDITOR=nvim visudo
```

Create wheel user with home dir

```bash
useradd -m -G wheel ven
```

Set up my dotfiles

```bash
git clone --recurse-submodules git@github.com:Vendicated/dotfiles.git
cd dotfiles
# Install dependencies
sudo pacman -S --needed - < pkglist.txt
# Deploy dotfiles
./installer.sh install
```

Install paru

```bash
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```
