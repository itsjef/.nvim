#!/bin/sh

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

# write initial setting for .vimrc
echo "Please add the following settings to the top of your init.vim file:"
{
  echo ""
  echo ""
  echo "\"Scripts ------------------------------------"
  echo "\" Required:"
  echo "set runtimepath+=$INSTALL_DIR"
  echo ""
  echo "source $INSTALL_DIR/vimrcs/basic.vim"
  echo "source $INSTALL_DIR/vimrcs/plugins_config.vim"
  echo "source $INSTALL_DIR/vimrcs/filetype.vim"
  echo ""
  echo "try"
  echo "  source $INSTALL_DIR/vimrcs/custom.vim"
  echo "catch"
  echo "endtry"
  echo ""
  echo "\" Optional:"
  echo "let g:python_host_prog='$(which python2)'"
  echo "let g:python3_host_prog='$(which python3)'"
  echo ""
  echo "\"End Scripts ------------------------------------"
  echo ""
  echo ""
}

echo "Done."

echo "Completed setup!"
