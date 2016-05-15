# Atom Installer
<p><img src="/images/Atom-1.7.2-AI.png" alt="Atom 1.7.2 running on Arch Linux"><caption><b>Figure 1: Atom 1.7.2 running on Arch Linux, opened to this very README file</b></caption></p>

This project's stated purpose is to create shell scripts for automating the installation process of [Atom](https://atom.io) on 32-bit and 64-bit Linux. The structure of this repository is (at the time of me writing this section of the README, more shell scripts should be added to the lib, i686 and x86_64 folders with time):

```bash
.
├── lib
│   ├── atom-build.sh
│   ├── atom-editor-aur.sh
│   ├── centos-build.sh
│   ├── debian-build.sh
│   ├── fedora-build.sh
│   ├── gentoo-build.sh
│   ├── linux-mint-build.sh
│   ├── mageia-build.sh
│   ├── node-build.sh
│   ├── opensuse-build.sh
│   ├── test.sh
│   └── ubuntu-build.sh
├── i686
│   ├── arch.sh
│   ├── centos.sh
│   ├── debian.sh
│   ├── fedora.sh
│   ├── gentoo.sh
│   ├── linux-mint.sh
│   ├── mageia.sh
│   ├── manjaro.sh
│   ├── opensuse.sh
│   ├── sabayon.sh
│   └── ubuntu.sh
├── x86_64
│   ├── arch.sh
│   ├── centos.sh
│   ├── debian.sh
│   ├── fedora.sh
│   ├── gentoo.sh
│   ├── linux-mint.sh
│   ├── mageia.sh
│   ├── manjaro.sh
│   ├── opensuse.sh
│   ├── sabayon.sh
│   └── ubuntu.sh
├── deploy.sh
├── help.sh
├── installer.sh
├── perms.sh
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

If you have cURL installed (to test if you do run `which curl`) then to use the quick-installer run:

```bash
/bin/bash -c "$(curl -sL https://git.io/vwEIX)"
```

while if you would rather use GNU wget run:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vwEIX)"
```

Alternatively, if you wish to quickly install Atom with my configuration settings, run:

```bash
/bin/bash -c "$(curl -sL https://git.io/vrLi9)"
```

or:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vrLi9)"
```

## Supported Distributions
The following distributions I have tried and successfully used the installer on:

* CentOS 7 (64-bit)
* Debian 8.4 (64-bit)
* Mageia 5 (64-bit)
* Ubuntu 16.04 (64-bit)

while I expect it to also work on the following distributions:

* Arch Linux
* CentOS (other versions)
* Debian (other versions)
* Fedora
* Gentoo Linux
* Mageia (other versions)
* Manjaro Linux
* openSUSE
* Sabayon Linux
* Ubuntu (other versions, as well as its derivatives like Linux Mint)

The way it detects the operating system it is being run on is by reading the `/etc/os-release` file. So, if you find that running `cat /etc/os-release | grep -w "NAME" | sed 's/NAME=//g' | sed 's/"//g'` returns the distribution names given above, your distribution should be supported by this installer.

## External Resources
* [Official Linux Build Instructions for Atom](https://github.com/atom/atom/blob/master/docs/build-instructions/linux.md).

## Contributing
For details on how to contribute to this project please see the [CONTRIBUTING.md](/CONTRIBUTING.md) file.

## License
The contents of this repository are licensed under the GNU General Public License version 3 (GNU GPLv3), for a copy, see [LICENSE](/LICENSE). The Atom text editor itself, however, is licensed under the MIT License.
