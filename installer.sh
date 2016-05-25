#!/bin/bash
# This script is the main script of this installer.

######################################################################################################
# This first section determines if the user passed the option "help" to the installer script.
if [[ "$1" == '-h' ]] || [[ "$1" == '--help' ]] || [[ "$1" == '?' ]]; then
  . ./help.sh
fi
######################################################################################################

######################################################################################################
# This section of the installer script detects the operating system
# and relevant hardware details.

# Distribution name. Previously lsb_release was used, but it failed on Docker containers so this
# substitute was made.
if [[ -f /etc/os-release ]]; then
  export LD=$(cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g')
  # Distribution version number, e.g., on Fedora 23 it returns 23
  export VER=$(cat /etc/os-release | grep -w "VERSION_ID" | sed 's/VERSION_ID=//g' | sed 's/"//g')
elif [[ -f /etc/pclinuxos-release ]]; then
  export LD=$(cat /etc/pclinuxos-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g')
  echo $LD
fi
# Distribution architecture
export ARCH=$(uname -m | sed 's/i[0-9]/i6/g')

######################################################################################################

# Load the distribution-specific libraries
if [[ $LD == "Arch Linux" ]] || [[ $LD == "Manjaro"* ]]; then
  source "lib/build/aur.sh"
elif [[ $LD == "CentOS"* ]]; then
  source "lib/build/centos.sh"
elif [[ $LD == "Debian"* ]]; then
  source "lib/build/debian.sh"
elif [[ $LD == "Fedora"* ]]; then
  source "lib/build/fedora.sh"
elif [[ $LD == "Gentoo"* ]]; then
  source "lib/build/gentoo.sh"
elif [[ $LD == "Mageia"* ]]; then
  source "lib/build/mageia.sh"
elif [[ $LD == "openSUSE"* ]]; then
  source "lib/build/opensuse.sh"
elif [[ $LD == "PCLinuxOS" ]]; then
  source "lib/build/pclinuxos.sh"
elif [[ $LD == "Sabayon"* ]]; then
  source "lib/build/sabayon.sh"
elif [[ $LD == "Ubuntu"* ]] || [[ $LD == "Zorin OS" ]]; then
  source "lib/build/ubuntu.sh"
fi

# List of supported distributions
DISTROS=(
'Arch'                                      #  Arch Linux
'CentOS'                                    #  CentOS
'Debian'                                    #  Debian
'Fedora'                                    #  Fedora
'Gentoo'                                    #  Gentoo Linux
'Mageia'                                    #  Mageia
'Manjaro'                                   #  Manjaro Linux
'openSUSE'                                  #  openSUSE
'PCLinuxOS'                                 #  PCLinuxOS
'Sabayon'                                   #  Sabayon Linux
'Ubuntu'                                    #  Ubuntu
'Zorin OS'                                  #  Zorin OS
)

for I in "${DISTROS[@]}"                    # Run the appropriate script, for the distro and architecture
do                                          # we're on
  i=$(echo $I | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g' ) # convert distro string to lowercase
  if [[ $LD == "$I"* ]]; then
    if [[ $i == "manjaro" ]]; then
      ./$ARCH/arch.sh
    elif [[ $i == "zorin-os" ]]; then
      ./$ARCH/ubuntu.sh
    else
      ./$ARCH/${i}.sh
    fi
  fi
done
