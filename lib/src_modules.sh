#!/bin/bash
function src_modules {
  # This function just makes the necessary adjustments to node modules being built.
  pkg_ver

  # create the node_modules folder, if need be
  if ! [[ -d node_modules ]]; then
    mkdir node_modules
  fi

  # Get the about-arch module
  curl -L https://github.com/fusion809/about/archive/v${_about_arch_ver}.tar.gz > /tmp/about-v${_about_arch_ver}.tar.gz
  tar -xzf /tmp/about-${_about_arch_ver}.tar.gz -C node_modules
  mv node_modules/about-${_about_arch_ver} node_modules/about-arch

  # Get the patch
  pushd node_modules/about-arch
  patch -Np1 -i $INDIR/resources/about-arch.patch
  popd

  cp $INDIR/resources/theme.patch .
  patch -Np1 -i theme.patch

  # Verbose the build process
  sed -i -e 's@node script/bootstrap@node script/bootstrap --no-quiet@g' \
  ./script/build || die "Fail fixing verbosity of script/build"
}

export -f src_modules
