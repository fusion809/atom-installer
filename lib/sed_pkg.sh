#!/bin/bash
for i in ./lib/pkg/*.sh
do
  source "$i"
done

function sed_pkg {
  # This function seds the Atom package.json file

  sed -i -e "/metrics/d" \
         -e "/exception-reporting/d" $SRC_DEST/atom/package.json
}

export -f sed_pkg
