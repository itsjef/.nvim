""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set how many lines of history VIM has to remember
set history=700

" Set autoread when a file is changed from outside
set autoread

" Set uncompatible with old Vi
set nocp

" Show relative line number
set rnu

" Show matching parenthese
set showmatch

" Clipboard
set clipboard+=unnamedplus

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

" Buffer navigation
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
nmap <leader>bd :bp<BAR>bd#<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lines to the cursor - when moving around with j/k keys
set so=999

" Indentation
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab autoindent

" Line mark
set list
set lcs=eol:¬

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

""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
" Set utf8 as standard encoding and en_US as the standard language
" set encoding=utf8

" Quickly open/reload nvimrc
nnoremap <leader>ev :split ~/.config/nvim/init.vim<cr>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<cr>

" Persistent undo - You can undo even after closing a buffer or Vim itself
try
    set udir=$HOME/.nvim/temp_dir/undo
    set undofile
catch
endtry

" highlight cursor line when in Insert Mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
