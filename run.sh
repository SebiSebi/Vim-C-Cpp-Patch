#!/bin/bash

# Some plugins require a minimum vim version. 
# Vim 8.0 should be enough.
vim_version="8.0"

# What packages to install apart from the basic ones.
declare -a packages;

numberOfPackages=7
packages=(
        "vim-doc"
        "vim-scripts"
        "cscope"
        "vim-gtk-py2"
        "vim-gtk3-py2"
        "vim-athena-py2"
        "exuberant-ctags"
);

# Install the latest vim version.
apt-get --assume-yes purge vim vim-nox vim-runtime
rm -rf ~/.vim
rm -rf ~/.vimrc

# In some Debian (Jessie and later - 2014) add-apt-repository
# can be found in software-properties-common, therefore
# install it first and then add the PPA.
apt-get install software-properties-common

add-apt-repository ppa:jonathonf/vim -y
apt-get update
apt-get --assume-yes install vim vim-nox # These vim packages must be installed.

# Install optional vim related packages.
for ((i = 0; i < $numberOfPackages; i++))
do
        pkg=${packages[${i}]}
        if [ $(apt-cache search --names-only "^${pkg}$" | wc -l) -ne 0 ];
        then
        	apt-get --assume-yes install ${pkg}
        fi
done

# Check if the installed version is new enough.
if [ $(vim --version | head -n 1 | grep $vim_version | wc -l) -ne 1 ||
     $(vim --version | echo $?) -ne 0]; # Vim command does not exist.
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
