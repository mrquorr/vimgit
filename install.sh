#! /bin/bash
#script for automatically installing mrquorr's vim environment

#dependencies
apt-get install build-install cmake
apt-get install python-dev

#variables
VUNDLE="vim +PluginInstall +qall"

mv ./.vim/ ~/
mv ./.vimrc ~/

#downloading vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run a vundle install
$VUNDLE

#installing clang
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
