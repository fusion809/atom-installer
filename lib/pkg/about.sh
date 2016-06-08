#!/bin/bash
function sed_about {

  sed -i -e "s/\"about\": \".*\",/\"about-arch\": \"${_about_arch_ver}\",/g" package.json

}

export -f sed_about
