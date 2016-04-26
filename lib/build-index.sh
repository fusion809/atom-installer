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
