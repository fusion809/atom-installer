#!/bin/bash

function atomin {
  cd /tmp/atom-editor
  makepkg -si --noconfirm
  cd .
}

export -f atomin
