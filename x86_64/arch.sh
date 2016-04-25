#!/bin/bash
export AUR=https://aur.archlinux.org/cgit/aur.git/snapshot/
export GIT=https://aur.archlinux.org/

if comex atom; then                       # Check if Atom is already installed

  printf "Atom is already installed!"

else

  printf "Would you rather install Atom from: A) a Debian binary (faster) or B) from source (slower, but more reliable)? [A/B]"
  read preference
  if [[ $preference == "A" ]]; then
    if comex yaourt; then
      yaourt -S atom-editor-bin --noconfirm
    elif comex git; then
      git clone $GIT/atom-editor-bin.git /tmp/atom-editor-bin
      cd /tmp/atom-editor-bin
      makepkg -si --noconfirm
      cd .
    elif comex curl; then
  elif [[ $preference == "B" ]]; then

    if comex yaourt; then                    # Install with yaourt if possible

      yaourt -S atom-editor --noconfirm

    elif comex git; then                      # Install with git and makepkg otherwise

      git clone $GIT/atom-editor.git /tmp/atom-editor
      atomin

    elif comex curl; then                     # Install with curl and makepkg otherwise

      curl -sL $AUR/atom-editor.tar.gz | tar xz -C /tmp
      atomin

    elif comex wget; then                     # Install with wget and makepkg otherwise

      wget -cqO- $AUR/atom-editor.tar.gz | tar xz -C /tmp
      atomin

    else                                      # Install curl and install with curl and makepkg otherwise

      sudo pacman -S curl --noconfirm
      curl -sL $AUR/atom-editor.tar.gz | tar xz -C /tmp
      cd /tmp/atom-editor
      makepkg -si --noconfirm
      cd .

    fi
fi
