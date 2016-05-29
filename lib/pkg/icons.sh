#!/bin/bash
function sed_icons {
  sed -i -e "/\"find-and-replace\": \".*\",/i \
            \"file-icons\": \"${_file_icons_ver}\"," package.json # file-icons
}

export -f sed_icons
