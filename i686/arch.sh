#!/bin/bash
export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/atom-editor.tar.gz
export GIT=https://aur.archlinux.org/atom-editor.git

if comex atom; then                       # Check if Atom is already installed
  printf "Atom is already installed!"
elif comex yaourt; then                   # Install with yaourt if possible
  yaourt -S atom-editor --noconfirm
elif comex git; then                      # Install with git and makepkg otherwise
  git clone $GIT /tmp/atom-editor
  atomin
elif comex curl; then                     # Install with curl and makepkg otherwise
  curl -sL $AUR | tar xz -C /tmp
  atomin
elif comex wget; then
  wget -cqO- $AUR | tar xz -C /tmp
  atomin
else
  sudo pacman -S curl --noconfirm
  curl -sL $AUR | tar xz -C /tmp
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
fi
