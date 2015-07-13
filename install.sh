echo 'Backing up your original files ...'
cp ~/.vimrc ~/.vimrc.bak

echo 'Installing new vimrc ...'
cd ~/.nvim_runtime

echo 'set runtimepath+=~/.nvim_runtime

try
    source ~/.nvim_runtime/vimrcs/custom.vim
catch
endtry

source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim
source ~/.nvim_runtime/vimrcs/filetype.vim
' > ~/.vimrc

echo "Installed succesfully! :D"
