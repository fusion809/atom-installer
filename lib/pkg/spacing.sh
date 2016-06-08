#!/bin/bash
function sed_spacing {
  sed -i -e "s|^\"|    \"|g"  package.json # fixing spacing issues
}

export -f sed_spacing
