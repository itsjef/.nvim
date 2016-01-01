""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set how many lines of history VIM has to remember
set history=700

" Set autoread when a file is changed from outside
set autoread

" Set uncompatible with old Vi
set nocp

" Show line number
set nu

" Show matching parenthese
set showmatch

" Set timeout length for double key
" set timeoutlen=200

" Enable syntax highlight "
syntax on

" Enable filetype plugins "
filetype plugin on
filetype indent on

" Mapping leader key
let mapleader = ","
let g:mapleader = ","

" Remapping ESC key
inoremap ii <ESC>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lines to the cursor - when moving around with j/k keys
set so=7

" Indentation
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab autoindent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" Set command bar height
set cmdheight=2

" Set Wild menu
set wildmenu
set wildmode=longest,full

" Status line
" Always show the status line - Mandatory for vim-airline to show"
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""
" Background theme
set background=dark
colorscheme onedark

""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Quickly open/reload nvimrc
nnoremap <leader>ev :split ~/.nvimrc<cr>
nnoremap <leader>sv :source ~/.nvimrc<cr>

" Persistent undo - You can undo even after closing a buffer or Vim itself
try
    set undodir=~/.nvim_runtime/temp_dir/undo_dir
    set undofile
catch
endtry

" highlight cursor line when in Insert Mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
