#!/bin/bash
function sed_shellscript {
  sed -i -e "s/\"language-shellscript\": \".*\"/\"language-shellscript\": \"${_language_shellscript_ver}\"/g" package.json
}

export -f sed_shellscript
