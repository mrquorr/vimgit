#! /bin/bash
#script for automatically installing mrquorr's vim environment

#dependencies and installations
apt-get install vim
apt-get install git
apt-get install build-install cmake
apt-get install python-dev

#variables
VUNDLE="vim +PluginInstall +qall"

#setting up vim environment
mv ./.vimrc ~/
mkdir ~/.vim/
mv ./colors/ ~/.vim
mv ./doc ~/.vim

#downloading vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run a vundle install
$VUNDLE

#installing clang
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
