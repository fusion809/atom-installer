# Atom Installer
This project's stated purpose is to create shell scripts for automating the installation process of Atom on 32-bit and 64-bit Linux. The structure of this repository is (at the time of me writing this section of the README, more shell scripts should be added to the lib, i686 and x86_64 folders with time):

```bash
.
├── lib
│   ├── atom-editor-aur.sh
│   └── test.sh
├── i686
│   ├── arch.sh
│   ├── centos.sh
│   ├── debian.sh
│   ├── fedora.sh
│   └── gentoo.sh
├── x86_64
│   ├── arch.sh
│   ├── centos.sh
│   ├── debian.sh
│   ├── fedora.sh
│   └── gentoo.sh
├── installer.sh
├── quick-install.sh
├── LICENSE
└── README.md
```

The most important script is the `installer.sh` script in the top-level directory of this repository. It is what determines the PC's architecture and Linux distribution and executes the corresponding script(s), accordingly. `i686` folder contains scripts specific to 32-bit systems, while the `x86_64` folder contains scripts specific to 64-bit systems. Under both folders each script is named according to the distribution it is for. The `lib` folder contains scripts that define functions that are useful for installing Atom on both `i686` and `x86_64` systems.

If you want to add another distribution to the set of supported distributions for this repository, please edit the `installer.sh` file (adding an entry for your new distribution to the `DISTROS` array) and add the relevant, required scripts to the `i686`, `x86_64` and `lib` folders. If you want to contribute to this project please do! You can do this by:

* Testing these scripts out on the various different supported distributions.
* Adding extra supported distributions via a pull request.
* Fixing errors or otherwise improving on existing scripts in this repository.
* Improving on this README or other forms of documentation.
* Reporting errors in these scripts via starting a [new issue](https://github.com/fusion809/atom-installer/issues/new).

## Quick Installer
A feature I have added to this repository is a quick install script (i.e., the `quick-install.sh` script). This script quickly gets the latest version of this repository locally and then runs the `installer.sh` script.

```bash
sh -c $(curl -sL https://git.io/vwEIX)
```

## External Resources
* [Official Linux Build Instructions for Atom](https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md).
