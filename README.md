# Vim-C-Cpp-Patch

WARNING: This will override your vimrc file from your user home directory.

1) Update your distro.

- [Intro](#intro)
- [Installation](#installation)
- [Feature Summary](#feature-summary)
- [Build and run usage](#build-and-run-usage)

Intro
-----

This patch aims to turn [Vim](http://www.vim.org/) into an IDE easy to use especially for C-family languages.
Check [Feature Summary](#feature-summary) to see what plugins this patch installs. The patch can be installed
on any Debian-like Linux distribution like Ubuntu or Mint.

Installation
------------

**WARNING** This will override your current .vimrc configuration file in user home directory.
Before installing make sure you update your distribution:

    sudo apt update
    sudo apt upgrade
    sudo apt dist-upgrade

Install git:

    sudo apt install git

Install patch:

    git clone https://github.com/SebiSebi/Vim-C-Cpp-Patch
    cd Vim-C-Cpp-Patch
    sudo ./run.sh

Feature Summary
-----

The following plugins will be installed by default:

1. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for code completion (works not only with C/C++);
2. [Vundle](https://github.com/VundleVim/Vundle.vim) for plugin installation. This can be further used if you want
to install other Vim plugins.

There are two optional features that you can install:

1. Build and run - lets you compile and run C/C++ code inside Vim.
2. A modified [colorscheme](https://github.com/tpope/vim-vividchalk).


Build and run usage
-----

The following shortcuts can be used if you choose to install this feature:

1. **Ctrl-r** builds and run all the C/C++ source files in the current directory;
2. **Ctrl-b** builds all the C/C++ source files in the current directory;
3. **Ctrl-l** lists the current run outputs;
4. **Ctrl-d** runs ddd debuger (make sure it is installed on your station).

By default, all sources are compiled with "g++ -std=c++11". You can easily change
this options in the .vimrc file to accomodate your requirements.



