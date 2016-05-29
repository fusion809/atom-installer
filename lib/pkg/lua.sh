#!/bin/bash
function sed_lua {
  sed -i -e "/\"language-less\": \".*\",/a \
              \"language-lua\": \"${_language_lua_ver}\"," package.json # Add Liquid, Lisp, Lua
}

export -f sed_lua
