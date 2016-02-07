#How to install

##Clone this repo
```
git clone https://github.com/itsjef/vimrc ~/.nvim_runtime
```

##Edit your dotfile

Copy and paste these line into __~/.vimrc__ (Vim) or __~/.config/nvim__ (Neovim):
```
set runtimepath+=~/.nvim_runtime

source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim
source ~/.nvim_runtime/vimrcs/filetype.vim

colorscheme gruvbox
```

Recomment using [*Powerline fonts*](https://github.com/powerline/fonts) for better displaying of certain plugins (vim-airline, etc ...)

###Optional

In order to display powerline symbols correctly in __vim-airline__, change your Terminal font to __Inconsolata-dz for Powerline__
