#!/usr/bin/env bash

# Time-stamp: <2012-05-31 17:12:43 Thursday by root>

# @version 1.0
# @author lgx

if [ -f ~/.bashrc ]
then
    mv ~/.bashrc ~/bashrc_yourself_old
fi

if [ -f ~/.vimrc ]
then
    mv ~/.vimrc ~/dotvimrc_yourself_old
fi

if [ -e ~/.vim ]
then
   mv ~/.vim ~/dotvim_yourself_old
fi

if [ -e ~/.emacs.d ]
then
   mv ~/.emacs.d ~/dotemacs.d_yourself_old
fi
###

ln -s ~/.myconf/.vim/.vimrc_A ~/.vimrc
ln -s ~/.myconf/.vim  ~/.vim
ln -s ~/.myconf/.bashrc  ~/.bashrc
ln -s ~/.myconf/.emacs.d  ~/.emacs.d

