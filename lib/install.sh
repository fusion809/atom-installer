#!/bin/bash
function atom_install {
  if [[ $DEST_TYPE == "local" ]]; then
    script/grunt install --channel=stable -_install-dir $INST_DEST
    printf "The Atom executable is now found at $SRC_DEST/$INST_DEST/bin/atom \n"
  else
    sudo script/grunt install --channel=stable -_install-dir $INST_DEST
  fi
}

export -f atom_install
