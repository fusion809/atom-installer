#!/bin/bash
function sed_termplus {
  sed -i -e "/\"package-generator\": \".*\",/a \
              \"terminal-plus\": \"${_terminal_plus_ver}\"," package.json
}

export -f sed_termplus
