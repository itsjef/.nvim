#Intro
My NeoVim configuration

#Screenshot
![alt text](https://raw.githubusercontent.com/itsjef/vimrc/268a15b54aef9669228837592ea0153252376043/screenshot.png "Gruvbox Dark High Contrast")

#How to install

##Clone this repo
```bash
git clone https://github.com/itsjef/nvimrc ~/.nvim_runtime
```

##Edit your dotfile

Copy and paste these line to __~/.config/nvim/init.vim__:
```vimL
set runtimepath+=~/.nvim_runtime

source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim
source ~/.nvim_runtime/vimrcs/filetype.vim

" colorscheme <your_favorite_colorscheme>
```

###FAQs

1, In order to display powerline symbols correctly in __vim-airline__, change your Terminal font to __Inconsolata-dz for Powerline__

2, No clipboard tool
> clipboard: No clipboard too available. See :help nvim-clipboard

Install xclip: `sudo apt-get install xclip`

3, Plugin is not loaded
> Taglist: Exuberant ctags (http://ctags.sf.net) not found in PATH. Plugin is not loaded.

Install ctags: `sudo apt-get install exuberant-ctags`

4, [Deoplete Requirements](https://github.com/Shougo/deoplete.nvim)
