#!/bin/bash
function sed_elect {
  # Edit Electron version
  sed -i -e "s/\"electronVersion\": \".*\"/\"electronVersion\": \"${_electron_ver}\"/g" package.json
}

export -f sed_elect
