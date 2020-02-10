#!/bin/sh

GIT_SSL_NO_VERIFY=true
INSTALL_DIR="$HOME/.nvim"
echo "Install to \"$INSTALL_DIR\"..."
if [ -e "$INSTALL_DIR" ]; then
  echo "\"$INSTALL_DIR\" already exists!"
fi

echo ""

# check git command
type git || {
  echo 'Please install git or update your path to include the git executable!'
  exit 1
}
echo ""

# make plugin dir and fetch dein
if ! [ -e "$INSTALL_DIR" ]; then
  echo "Begin fetching ..."
  git clone https://github.com/itsjef/.nvim "$INSTALL_DIR"

  echo "Done."
  echo ""
fi

curl --insecure -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p $HOME/.config/nvim/

# write initial setting for .vimrc
cat <<EOT >> $HOME/.config/nvim/init.vim
" Required:
set runtimepath+=$INSTALL_DIR

source $INSTALL_DIR/vimrcs/basic.vim
source $INSTALL_DIR/vimrcs/plugins_config.vim
source $INSTALL_DIR/vimrcs/filetype.vim

try
  source $INSTALL_DIR/vimrcs/custom.vim
catch
endtry

" Optional:
let g:python_host_prog='$(which python2)'
let g:python3_host_prog='$(which python3)'
EOT

ln -sf $HOME/.config/nvim/init.vim $HOME/.nvimrc
ln -sf $INSTALL_DIR/coc-settings.json $HOME/.config/nvim/coc-settings.json

vim +PlugInstall +qall

echo "Completed setup!"
