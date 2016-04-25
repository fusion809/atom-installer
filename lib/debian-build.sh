function debian-build {
  curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
  sudo apt-get install -y nodejs npm build-essential git libgnome-keyring-dev fakeroot

  atom-build
}
