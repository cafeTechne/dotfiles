#!/bin/bash

echo Getting vundle
git submodule update --init

echo Making symbolic links
ln -s $PWD/.vim $HOME/.vim
ln -s $PWD/.vim/.vimrc $HOME/.vimrc

echo Installing bundles
vim +BundleInstall +qall
