#!/bin/bash
function version {
  if ! [[ -d /tmp/atom-editor ]]; then
    git clone https://aur.archlinux.org/atom-editor.git /tmp/atom-editor
  else
    cd /tmp/atom-editor
    git pull origin master
  fi
  pkgver=$(sed -n 's/pkgver=//p' /tmp/atom-editor/PKGBUILD)
  export pkgver
}

export -f version
