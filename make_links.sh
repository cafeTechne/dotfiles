#!/bin/bash

echo Setting .bashrc
ln -sf $PWD/bash/.bashrc $HOME/.bashrc

echo Getting vundle
git submodule update --init

echo Making symbolic links
ln -sf $PWD/.vim $HOME/.vim
ln -sf $PWD/.vim/.vimrc $HOME/.vimrc

echo Installing bundles
vim +BundleInstall +qall
