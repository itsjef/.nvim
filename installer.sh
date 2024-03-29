#!/bin/sh

GIT_SSL_NO_VERIFY=true
INSTALL_DIR="$HOME/.config/nvim"
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

sh -c 'git clone --filter=blob:none --branch=stable https://github.com/folke/lazy.nvim.git \
"${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/lazy/lazy.nvim'

# write initial setting for .vimrc
cat <<EOF >> $INSTALL_DIR/init.lua
vim.g.python_host_prog = '$(which python2)'
vim.g.python3_host_prog = '$(which python3)'

-- do not reorder
require('globals')
require('general')
require('keymappings')
require('plugins')
require('themes')
EOF

echo "Completed setup!"
