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

Copy and paste these line to __~/.config/nvim/init.vim__ (NeoVim) and/or __~/.config/.vimrc__ (Vim):
```vimL
set runtimepath+=~/.nvim

source ~/.nvim/vimrcs/basic.vim
source ~/.nvim/vimrcs/plugins_config.vim
source ~/.nvim/vimrcs/filetype.vim

colorscheme gruvbox " <= Replace this with your favorite theme
```

##Install Neovim python-client
```
pip2 install -U neovim
pip3 install -U neovim
```

##Install Plugins
```
:PlugInstall
```

#FAQs

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
