#!/bin/bash

# Check if Atom is already installed
if comex atom; then
  printf "Atom is already installed!"
elif comex yaourt; then
  yaourt -S atom-editor --noconfirm
elif comex git; then
  git clone https://aur.archlinux.org/atom-editor.git /tmp/atom-editor
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
elif comex curl; then
  curl -sL https://aur.archlinux.org/cgit/aur.git/snapshot/atom-editor.tar.gz | tar xz -C /tmp
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
elif comex wget; then
  wget -cqO- https://aur.archlinux.org/cgit/aur.git/snapshot/atom-editor.tar.gz | tar xz -C /tmp
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
else
  sudo pacman -S curl --noconfirm
  curl -sL https://aur.archlinux.org/cgit/aur.git/snapshot/atom-editor.tar.gz | tar xz -C /tmp
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
fi
