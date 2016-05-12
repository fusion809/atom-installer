. ./lib/atom-build.sh

function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_6.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y python nodejs-devel gcc gcc-c++ make \  # Install the dependencies
    glibc-devel git-core libgnome-keyring-devel
  atom-build
}

export -f centos-build
