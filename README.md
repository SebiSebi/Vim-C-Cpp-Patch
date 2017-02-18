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

    sudo apt get update
    sudo apt get upgrade
    sudo apt get dist-upgrade



Feature Summary
-----

The following plugins will be installed by default:

1. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe)
2. [Vundle](https://github.com/VundleVim/Vundle.vim)

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



