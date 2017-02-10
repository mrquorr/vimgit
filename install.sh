#! /bin/bash
#script for automatically installing mrquorr's vim environment

echo 'Wakatime api key: 71f22402-e902-453a-a8c2-bf4217f3070f'
#variables
#VUNDLE="vim +PluginInstall +qall"

#setting up vim environment
cp ./.vimrc ~/
mkdir -p ~/.vim/colors
cp ./colors/Chasing_Logic.vim ~/.vim/colors/Chasing_Logic.vim

#downloading vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#run a vundle install
vim +PluginInstall +qall
#$VUNDLE

#installing clang
#cd ~/.vim/bundle/YouCompleteMe
#./install.py --clang-completer
