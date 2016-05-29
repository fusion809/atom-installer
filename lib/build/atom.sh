#!/bin/bash
source "./lib/build/default.sh"
source "./lib/dest.sh"
source "./lib/method.sh"
source "./lib/src_build.sh"
source "./lib/get_atom_src.sh"
source "./lib/src_prepare.sh"
source "./lib/install.sh"
source "./lib/version.sh"
source "./lib/test.sh"

function atom_build {
  export GHUB=$HOME/GitHub

  if ! `comex node-gyp`; then
    sudo npm install -g node-gyp
  fi

  printf "Do you want to just use the default settings (A) or would you rather choose your own settings (B)? \n[Available options: A/B. A is the default.]\n"
  read settings

  if [[ $settings = "B" ]]; then
    # Set the dest variables
    dest

    # Set the pkgver variable
    version

    # Get the source code
    get_atom_src

    # Compile the source
    printf "Which of the following would you prefer:\n
A.) Atom built with my (that is, fusion809's) own preferred packages.\n
B.) Option A.), except with the platformio-ide and platformio-ide-terminal packages replacing nuclide and terminal-plus packages, respectively.\n
C.) Atom built with the standard set of packages. Minus the exception-reporting and metrics packages (due to privacy concerns), with language-gfm2 and language-liquid replacing language-gfm.\n
D.) Option C.) plus my preferred themes (dark-bint-syntax and fusion-ui). "
    read ynp

    if [[ $ynp == "C" ]]; then
      src_prepare
    elif [[ $ynp == "B" ]]; then
      src_prepare platformio
    elif [[ $ynp == "A" ]]; then
      src_prepare custom
    elif [[ $ynp == "D" ]]; then
      src_prepare themes
    fi

    src_build

    # Install it
    atom_install

  else

    default

  fi
}

export -f atom_build
