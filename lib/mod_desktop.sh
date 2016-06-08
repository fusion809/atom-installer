#!/bin/bash
function mod_desktop {
  # This function gets a custom desktop file

  cp $INDIR/resources/atom.desktop.in $SRC_DEST/atom/resources/linux/
}

export -f mod_desktop
