#!/bin/bash

# Some plugins require a minimum vim version. 
# Vim 8.0 should be enough.
vim_version="8.0"

# Install the latest vim version.
apt --assume-yes purge vim vim-nox vim-runtime gvim
add-apt-repository ppa:jonathonf/vim -y
apt update
apt --assume-yes install vim vim-nox ctags vim-doc vim-scripts cscope vim-gtk-py2 vim-gtk3-py2 vim-athena-py2

# Check if the installed version is new enough.
if [ $(vim --version | head -n 1 | grep $vim_version | wc -l) -ne 1 ];
then
	echo "Vim version is not good enough. Run vim --version to check if it is greater than ${vim_version}."
	exit 1
else 
	echo "Vim version ok."
fi

# Install You Complete Me with semantic support for C-family languages.
apt-get --assume-yes install build-essential cmake
apt-get --assume-yes install python-dev python3-dev
apt-get --assume-yes install git

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
touch ~/.vimrc
cat src/vundle.config > ~/.vimrc
vim +PluginInstall +qall

# Add support for C-family languages.
current_dir=$(pwd)
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

cd $current_dir
touch ~/.vim/.ycm_extra_conf.py
cat src/ycm_extra_conf.py > ~/.vim/.ycm_extra_conf.py
cat src/ycm_C.config >> ~/.vimrc

# Add build and run support.
echo "Do you want to add build and run support? [Y/n]"
read opt
if [ "$opt" != "n" ];
then
	cat src/build_and_run.config >> ~/.vimrc
fi

# Add colorscheme.
echo "Do you want to add the colorscheme? [Y/n]"
read opt
if [ "$opt" != "n" ];
then
	mkdir ~/.vim/colors
	cp src/my_vividchalk.vim ~/.vim/colors
	echo "colorscheme my_vividchalk" >> ~/.vimrc	
fi
