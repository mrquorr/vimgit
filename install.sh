#! /bin/bash
#script for automatically installing mrquorr's vim environment

#variables
VUNDLE="vim +PluginInstall +qall"

mv ./.vim/ ~/
mv ./.vimrc ~/

#dependencies
apt-get install build-install cmake
apt-get install python-dev
#run a vundle install
$VUNDLE

#installing clang
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
