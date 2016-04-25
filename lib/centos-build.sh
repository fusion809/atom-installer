function centos-build {
  # Get dependencies
  curl -sL https://rpm.nodesource.com/setup_5.x | sudo bash -     # Get the latest version of Node.js
  sudo yum install -y python nodejs-devel npm gcc gcc-c++ make \  # Install the dependencies
    glibc-devel git-core

  atom-build
}
