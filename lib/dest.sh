#!/bin/bash
function dest {
  printf "Where do you want to store the source code? [Leave empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  DEST_TYPE="system"

  printf "Where do you want to install Atom? [Leave empty for /usr (system)] "
  read INST_DEST

  if ! [[ -n $INST_DEST ]]; then
    if [[ $DEST_TYPE == "system" ]]; then
      INST_DEST="/usr"
    else
      INST_DEST="$HOME/.local"
    fi
  fi

  if ! [[ -d $INST_DEST ]]; then
    mkdir -p $INST_DEST
  fi

  export SRC_DEST
  export DEST_TYPE
  export INST_DEST
}

export -f dest
