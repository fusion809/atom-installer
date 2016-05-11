## This script gives Atom my configuration settings
if which curl >/dev/null 2>&1; then
  /bin/bash -c "$(curl -sL https://git.io/vwEIX)"
elif which wget >/dev/null 2>&1; then
  /bin/bash -c "$(wget -cqO- https://git.io/vwEIX)"
fi

export AT=$HOME/.atom
export GHUBM=$HOME/GitHub/mine
export GHUBO=$HOME/GitHub/others

# Change into config folder
cd $AT

# Initialize it as a git repo
git init

# Remove existing csons and less files
rm *.cson *.less

# Add remote origin
git remote add origin git@github.com:fusion809/atom.git

# Pull repository
git pull origin master

# Clone necessary repos
git clone https://github.com/DanBrooker/file-icons $GHUBO/file-icons
apm link $GHUBO/file-icons

git clone git@github.com:fusion809/fusion-ui.git $GHUBM/fusion-ui
apm link $GHUBM/fusion-ui

git clone https://github.com/FortAwesome/Font-Awesome $AT/Font-Awesome
git clone https://github.com/vorillaz/devicons $AT/devicons
git clone https://github.com/Lukas-W/font-linux $AT/font-linux
git clone https://github.com/fizzed/font-mfizz $AT/font-mfizz
git clone https://github.com/driftyco/ionicons/ $AT/ionicons
