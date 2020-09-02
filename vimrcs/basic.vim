syntax on " Basic syntax highlighting
set nu " Display line number
set clipboard+=unnamedplus " Activate system clipboard
set tabstop=4 softtabstop=4 " a <Tab> is 4 spaces long
set shiftwidth=4 " indenting with 4 spaces
set expandtab " use space characters when inserting a <Tab> in Insert mode
set list " Display line begin/end marks
set listchars=eol:¬
set incsearch " Search as you type
set ignorecase " Ignore case in search patterns
set smartcase " Do case-sensitive searching if the search pattern contains upper case characters
set termguicolors " Enable true colors
set cursorline " Display the line you are in
set scrolloff=999 " Keep cursor in the middle of the screen
try " Persistent undo
  set undodir=$HOME/.nvim/temp_dir/undo
  set undofile
catch
endtry


" Quick shortcut for splittling
nnoremap <C-W>- :split<CR>
nnoremap <C-W>\ :vsplit<CR>
set splitbelow
set splitright


" Moving between windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


" Mapping leader key
let mapleader = ","
let g:mapleader = ","


" Buffer navigation
nmap <leader>h :bprevious<CR>
nmap <leader>l :bnext<CR>


" Live substitute
if has('nvim')
  set inccommand=nosplit
endif


" Break undo sequence to smaller chunks
inoremap . .<C-g>u
inoremap ? ?<C-g>u
inoremap ! !<C-g>u
inoremap , ,<C-g>u
