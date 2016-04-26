#!/bin/bash

# This script is the main script of this installer. It detects the operating system
# and relevant hardware details.

if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]] || [[ "$1" == '?' ]]; then
  . ./help.sh
fi
# Distribution name
export LD=$(cat /etc/os-release | grep -w "NAME" | sed 's/NAME="//g' | sed 's/"//g')
# Distribution architecture
export ARCH=$(uname -m)
# Distribution version number, e.g., on Fedora 23 it returns 23
export VER=$(cat /etc/os-release | grep -w "VERSION_ID" | sed 's/VERSION_ID=//g' | sed 's/"//g')

source "lib/test.sh"                        # Load the test functions

# Load the distribution-specific libraries
if [[ $LD == "Arch Linux" ]] || [[ $LD == "Manjaro"* ]]; then
  source "lib/atom-editor-aur.sh"
elif [[ $LD == "CentOS"* ]]; then
  source "lib/centos-build.sh"
elif [[ $LD == "Debian"* ]]; then
  source "lib/debian-build.sh"
elif [[ $LD == "Fedora"* ]]; then
  source "lib/fedora-build.sh"
elif [[ $LD == "Linux Mint"* ]]; then
  source "lib/linux-mint-build.sh"
elif [[ $LD == "Mageia"* ]]; then
  source "lib/mageia-build.sh"
elif [[ $LD == "openSUSE"* ]]; then
  source "lib/opensuse-build.sh"
elif [[ $LD == "Ubuntu"* ]]; then
  source "lib/ubuntu-build.sh"
fi

DISTROS=(                                   # List of supported distributions
'Arch'                                      #  Arch Linux
'CentOS'                                    #  CentOS
'Debian'                                    #  Debian
'Fedora'                                    #  Fedora
'Gentoo'                                    #  Gentoo Linux
'Linux Mint'                                #  Linux Mint
'Manjaro'                                   #  Manjaro Linux
'openSUSE'                                  #  openSUSE
'Sabayon'                                   #  Sabayon Linux
'Ubuntu'                                    #  Ubuntu
)

for I in "${DISTROS[@]}"                    # Run the appropriate script, for the distro and architecture
do                                          # we're on
  i=$(echo $I | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' ) # convert distro string to lowercase
  if [[ $LD == "$I"* ]]; then
    ./$ARCH/${i}.sh
  fi
done
