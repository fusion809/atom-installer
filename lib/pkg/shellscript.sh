#!/bin/bash
function sed_shellscript {
  sed -i -e "s/\"language-shellscript\": \".*\"/\"language-unix-shell\": \"${_language_unix_shell_ver}\"/g" package.json
}

export -f sed_shellscript
