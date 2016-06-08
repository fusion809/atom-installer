#!/bin/bash
function sed_rust {
  sed -i -e "/\"archive-view\": \".*\",/a \
              \"atom-language-rust\": \"${_atom_language_rust_ver}\"," package.json
}

export -f sed_rust
