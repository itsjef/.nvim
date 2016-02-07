#Screenshot
![alt text](https://raw.githubusercontent.com/itsjef/vimrc/master/screenshot.png "Gruvbox Dark High Contrast")

#How to install

##Clone this repo
```bash
git clone https://github.com/itsjef/vimrc ~/.nvim_runtime
```

##Edit your dotfile

Copy and paste these line into __~/.vimrc__ (Vim) or __~/.config/nvim__ (Neovim):
```vimL
set runtimepath+=~/.nvim_runtime

source ~/.nvim_runtime/vimrcs/basic.vim
source ~/.nvim_runtime/vimrcs/plugins_config.vim
source ~/.nvim_runtime/vimrcs/filetype.vim

" colorscheme <your_favorite_colorscheme>
```

Recommend using [*Powerline fonts*](https://github.com/powerline/fonts) for better displaying of certain plugins (vim-airline, etc ...)

###Optional

1, In order to display powerline symbols correctly in __vim-airline__, change your Terminal font to __Inconsolata-dz for Powerline__

2, Update plugins:
```bash
$ chmod +x update-plugins.sh
$ ./update-plugins.sh
```
