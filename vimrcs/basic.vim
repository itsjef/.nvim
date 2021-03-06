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

" Buffer navigation & manipulation
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
nmap <leader>bd :bp\|bd#<CR>

" Mouse
set mouse=n

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
"""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set lines to the cursor - when moving around with j/k keys
set scrolloff=999

" Indentation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

" Line mark
set list
set listchars=eol:¬

" When searching try to be smart about cases
set smartcase

" Don't redraw while executing macros (good performance config)
set lazyredraw

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

" Clear highlighted search result
nnoremap <ESC> :noh<CR><ESC>
