#! /bin/bash
#script for automatically installing mrquorr's vim environment

#variables
VUNDLE="vim +PluginInstall +qall"

#setting up vim environment
cp ./.vimrc ~/
mkdir -p ~/.vim/colors
cp ./colors/Chasing_Logic.vim ~/.vim/colors/Chasing_Logic.vim

#downloading vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run a vundle install
$VUNDLE

#installing clang
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
