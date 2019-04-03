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
" inoremap ii <ESC>

" Buffer navigation
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
nmap <leader>bd :b#<BAR>bd#<CR>

" Mouse
set mouse=n

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

" Line mark
set list
set lcs=eol:¬

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" Set Wild menu
set wildmode=longest,full

" Display the line you are in
set cursorline

" 'Natural' splitting
set splitbelow
set splitright

"""""""""""""""""""""""""""""""""""""""""
" => Colors
"""""""""""""""""""""""""""""""""""""""""
set termguicolors

""""""""""""""""""""""""""""""
" => Misc
""""""""""""""""""""""""""""""
" Quickly open/reload nvimrc
nnoremap <leader>ev :e ~/.nvimrc<cr>
nnoremap <leader>eb :e ~/.nvim/vimrcs/basic.vim<cr>
nnoremap <leader>ep :e ~/.nvim/vimrcs/plugins_config.vim<cr>
nnoremap <leader>sv :so ~/.nvimrc<cr>

" Persistent undo - You can undo even after closing a buffer or Vim itself
try
  set udir=$HOME/.nvim/temp_dir/undo
  set undofile
catch
endtry

" Quick shortcut for splittling
nnoremap <C-W>- :split<CR>
nnoremap <C-W>\ :vsplit<CR>

" Live substitute
if has('nvim')
  set inccommand=nosplit
endif

" Quick open terminal
nnoremap <leader>t :bo sp<BAR>te<CR>
set shell=/bin/bash
au TermOpen term://* startinsert
" au TermClose term://* bd!
" tnoremap <Esc> <C-\><C-n>

" Break undo sequence to smaller chunks
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap , ,<C-g>u

" Moving between windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
