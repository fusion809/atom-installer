#!/bin/bash

# This script is the main script of this installer. It detects the operating system
# and relevant hardware details.

if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]] || [[ "$1" == '?' ]]; then
  . ./help.sh
fi
export LD=$(cat /etc/os-release | grep PRETTY_NAME | sed 's/PRETTY_NAME="//g' | sed 's/"//g') # current distribution name
export ARCH=$(uname -m)                     # current CPU architecture
export VER=$(lsb_release -sr)               # current distribution version

source "lib/test.sh"                        # Load the test functions

# Load the distribution-specific libraries
source "lib/atom-editor-aur.sh"
source "lib/centos-build.sh"
source "lib/debian-build.sh"
source "lib/fedora-build.sh"
source "lib/linux-mint-build.sh"
source "lib/mageia-build.sh"
source "lib/opensuse-build.sh"
source "lib/ubuntu-build.sh"

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
