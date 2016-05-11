## This script gives Atom my configuration settings
if which curl >/dev/null 2>&1; then
  /bin/bash -c "$(curl -sL https://git.io/vwEIX)"
elif which wget >/dev/null 2>&1; then
  /bin/bash -c "$(wget -cqO- https://git.io/vwEIX)"
fi

# Change into config folder
cd $HOME/.atom

# Initialize it as a git repo
git init

# Remove existing csons and less files
rm *.cson *.less

# Add remote origin
git remote add origin git@github.com:fusion809/atom.git

# Pull repository
git pull origin master
