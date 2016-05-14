#!/bin/bash
function dest {
  printf "Where do you want to store the source code? [Leavy empty for $GHUB] "
  read SRC_DEST

  if ! [[ -n $SRC_DEST ]]; then
    SRC_DEST=$GHUB
  fi

  printf "Do you want to install Atom locally or system-wide? [local/system, default: system] "
  read DEST_TYPE

  printf "Where do you want to install Atom? [Leave empty for ./install (local) and /usr (system)] "
  read INST_DEST

  if ! [[ -n $INST_DEST ]]; then
    if [[ $DEST_TYPE == "local" ]]; then
      INST_DEST=$SRC_DEST/atom*/install
    else
      INST_DEST=/usr
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
