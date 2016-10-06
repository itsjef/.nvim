#Intro
My NeoVim configuration

#Screenshot
![alt text](https://raw.githubusercontent.com/itsjef/vimrc/268a15b54aef9669228837592ea0153252376043/screenshot.png "Gruvbox Dark High Contrast")

#How to install

##Clone this repo
```bash
git clone https://github.com/itsjef/.nvim $HOME/.nvim --depth 1
```

##Edit your dotfile

Copy and paste these line to __~/.config/nvim/init.vim__ (NeoVim) and/or __~/.vimrc__ (Vim):
```vimL
set runtimepath+=~/.nvim

source ~/.nvim/vimrcs/basic.vim
source ~/.nvim/vimrcs/plugins_config.vim
source ~/.nvim/vimrcs/filetype.vim

" Theme
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " Uncomment this line if using NeoVim 0.1.4 and below
" set termguicolors " NeoVim 0.1.5 and above
" No need to uncomment those 2 lines above if you are using Vim, not NeoVim
colorscheme gruvbox " <= Replace this with your favorite theme
```

##Install Neovim python-client (if you use NeoVim)
```
pip2 install -U neovim
pip3 install -U neovim
```

##Install Neovim gem (if you use NeoVim)
```
gem install neovim
```

##Install Plugins

Open (Neo)Vim, run:
```
:PlugInstall
```

To update plugins, run:
```
:PlugUpdate
```

Reference: [Here](https://github.com/junegunn/vim-plug)

#Features

1. You can undo change to a file even after quitting Vim.
2. Press ,f to open a list of mru (most recently used files)
3. Ctrl-W and | for vertical split, Ctrl-W and - for horizontal split
4. Autocompletion for certain programming languages (checkout __plugins_config.vim__)
5. Easy plugin installation, thanks to [vim-plug](https://github.com/junegunn/vim-plug)
6. ...

#FAQs

##You are using Vim, not NeoVim
> I commented out some Vim configurations which are default in NeoVim. If you are using Vim and things don't look right then go edit __basic.vim__ by removing those comments.
> However, I recommend you to switch to [neovim](https://github.com/neovim/neovim/)

##TrueColor and Icons
> In order to display powerline symbols as well as colorscheme correctly, use a [Terminal that supports TrueColor](https://gist.github.com/XVilka/8346728) and change your Terminal font to a [Powerline Font](https://github.com/powerline/fonts) (mine is __Inconsolata-dz for Powerline__)

##No clipboard tool
> clipboard: No clipboard too available. See :help nvim-clipboard

Install xclip: `sudo apt-get install xclip`

##Plugin is not loaded
> Taglist: Exuberant ctags (http://ctags.sf.net) not found in PATH. Plugin is not loaded.

Install ctags: `sudo apt-get install exuberant-ctags`

##Autocomplete
> [Deoplete Requirements](https://github.com/Shougo/deoplete.nvim)
