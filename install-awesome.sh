#!/bin/bash
set -e

echo 'Writing configurations...'
echo 'set runtimepath+=~/.nvim

source ~/.nvim/vimrcs/basic.vim
source ~/.nvim/vimrcs/plugins_config.vim
source ~/.nvim/vimrcs/filetype.vim

try
  source ~/.nvim/vimrcs/my_config.vim
catch
endtry' > $HOME/.config/nvim/init.vim

[[ ! -L $HOME/.nvimrc && ! -f $HOME/.nvimrc ]] && echo 'Creating symlink...' && ln -s $HOME/.config/nvim/init.vim $HOME/.nvimrc

echo 'Done!'
