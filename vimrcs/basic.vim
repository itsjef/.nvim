""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mapping leader key
let mapleader = ","
let g:mapleader = ","

" Show relative line number
set nu rnu

" Clipboard
set clipboard+=unnamedplus

" Buffer navigation & manipulation
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>
nmap <leader>bd :bp\|bd#<CR>

" Use mouse in Normal model
set mouse=n

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
set ignorecase
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

" Enables 24-bit RGB color in the |TUI|
set termguicolors

" Live substitute
set inccommand=nosplit

" Persistent undo - You can undo even after closing a buffer or Vim itself
try
  set udir=$HOME/.config/nvim/temp_dir/undo
  set undofile
catch
endtry

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quickly open/reload nvimrc
nnoremap <leader>ev :e $HOME/.config/nvim/init.lua<cr>
nnoremap <leader>eb :e $HOME/.config/nvim/vimrcs/basic.vim<cr>
nnoremap <leader>ep :e $HOME/.config/nvim/vimrcs/plugins.vim<cr>
nnoremap <leader>sv :luafile $HOME/.config/nvim/init.lua<cr>

" Quick shortcut for splittling
nnoremap <C-W>- :split<CR>
nnoremap <C-W>\ :vsplit<CR>

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
