#!/bin/bash

# This script is the main script of this installer. It detects the operating system
# and relevant hardware details.


export LD=$(lsb_release -sd | sed 's/"//g') # current distribution name
export ARCH=$(uname -m)                     # current CPU architecture
export VER=$(lsb_release -sr)               # current distribution version

source "lib/test.sh"                        # Load the test functions
if [[ $LD == "Arch Linux" ]]; then          # Load AUR function
  source "lib/atom-editor-aur.sh"
elif [[ $LD == "CentOS"* ]]; then           # Load CentOS function
  source "lib/centos-build.sh"
elif [[ $LD == "Debian"* ]]; then
  source "lib/debian-build.sh"
elif [[ $LD == "Fedora"* ]]; then
  source "lib/fedora-build.sh"
fi

DISTROS=(                                   # List of supported distributions
'Arch'                                      #  Arch Linux
'CentOS'                                    #  CentOS
'Debian'                                    #  Debian
'Fedora'                                    #  Fedora
'Gentoo'                                    #  Gentoo Linux
'Linux Mint'                                #  Linux Mint
'Mageia'                                    #  Mageia
'openSUSE'                                  #  openSUSE
'Sabayon'                                   #  Sabayon Linux
'Ubuntu'                                    #  Ubuntu
)

for I in "${DISTROS[@]}"                    # Run the appropriate script, for the distro and architecture
do                                          # we're on
  i=$(echo $I | tr '[:upper:]' '[:lower:]') # convert distro string to lowercase
  if [[ $LD == "$I"* ]]; then
    ./$ARCH/${i}.sh
  fi
done
