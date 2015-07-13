echo 'Backing up your original files ...'
cp ~/.vimrc ~/.vimrc.bak

echo 'Installing new vimrc ...'
cd ~/.nvim_runtime

echo 'set runtimepath+=~/.vim_runtime

try
source ~/.vim_runtime/vimrcs/my_configs.vim
catch
endtry

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

set nocp
set nu
inoremap ii <ESC>' > ~/.vimrc

echo "Installed succesfully! :D"
