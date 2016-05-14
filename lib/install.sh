#!/bin/bash
function atom-install {
  if [[ $DEST_TYPE == "local" ]]; then
    script/grunt install --channel=stable --install-dir $INST_DEST
    printf "The Atom executable is now found at $SRC_DEST/$INST_DEST/bin/atom \n"
  else
    sudo script/grunt install --channel=stable --install-dir $INST_DEST
  fi
}

export -f atom-install
