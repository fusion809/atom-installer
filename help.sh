printf "Hi, you have opted for the in-built help of this repository.\n"
printf 'If you run the `installer.sh` script, without options (i.e., by running `./installer.sh`)
it should install Atom for you. The algorithm it goes through to install Atom is:

1. If possible it will install Atom from one of the pre-compiled binaries provided by the
Atom team. It will prompt you before doing this and ask you if you would prefer to install
Atom from the available binary or from source code.

2. If a binary package exists for Atom in an official repository of the distribution being used
it will install Atom from it.

3. If option 1 or 2 are not possible, or if you opted to install Atom from source code it will
run the `./lib/build/atom.sh` script after installing any missing build/runtime dependencies
for Atom

Note it will NOT install Atom from unofficial binaries or repositories.'
