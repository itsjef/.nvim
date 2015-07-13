echo 'Backing up your original files ...'
cp ~/.vimrc ~/.vimrc.bak

echo 'Installing new vimrc ...'
cd ~/.nvim_runtime

echo 'set runtimepath+=~/.nvim_runtime

source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim

set nocp
set nu
inoremap ii <ESC>' > ~/.vimrc

echo "Installed succesfully! :D"
