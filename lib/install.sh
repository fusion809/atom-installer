#!/bin/bash
function atom_install {
  if [[ $DEST_TYPE == "system" ]]; then
    sudo script/grunt install --channel=stable -_install-dir $INST_DEST
  else
    script/grunt install --channel=stable -_install-dir $INST_DEST
    printf "The Atom executable is now found at $SRC_DEST/$INST_DEST/bin/atom \n"
  fi
}

export -f atom_install
