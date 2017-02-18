#!/bin/bash

# Some plugins require a minimum vim version. 
# Vim 8.0 should be enough.
vim_version="8.0"

# Install the latest vim version.
# apt purge vim vim-nox vim-runtime gvim
# add-apt-repository ppa:jonathonf/vim
# apt update
# apt install vim vim-nox ctags vim-doc vim-scripts cscope vim-gtk-py2 vim-gtk3-py2 vim-athena-py2

# Check if the installed version is new enough.
if [ $(vim --version | head -n 1 | grep $vim_version | wc -l) -ne 1 ];
then
	echo "Vim version is not good. Run vim --version to check."
	exit 1
else 
	echo "Vim version ok."
fi






