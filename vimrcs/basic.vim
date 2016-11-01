""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show relative line number
set nu rnu

" Clipboard
set clipboard+=unnamedplus

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
set expandtab
" set autoindent

" Line mark
set list
set lcs=eol:¬

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Set Wild menu
set wildmenu
set wildmode=longest,full

"""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""
if (empty($TMUX))
  if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1 " NeoVim 0.1.4 and below
  endif

  if (has("termguicolors"))
    set termguicolors " NeoVim 0.1.5 and above
  endif
endif

""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
" Quickly open/reload nvimrc
nnoremap <leader>ev :e ~/.nvimrc<cr>
nnoremap <leader>sv :source ~/.nvimrc<cr>

" Persistent undo - You can undo even after closing a buffer or Vim itself
try
    set udir=$HOME/.nvim/temp_dir/undo
    set undofile
catch
endtry

"" Quick shortcut for splittling
nnoremap <C-W>- :split<CR>
nnoremap <C-W>\ :vsplit<CR>
