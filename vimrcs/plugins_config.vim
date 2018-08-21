""""""""""""
" vim-plug "
""""""""""""
" if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
"   execute '!curl https://raw.github.com/junegunn/vim-plug/master/plug.vim -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs'
" endif

call plug#begin('~/.nvim/bundle')
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'

" Colorscheme & Display helper
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot', {'do': './build'}

" Utils
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Autocompletion and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
call plug#end()

"""""""""""""""""""""
" => Autocompletion "
"""""""""""""""""""""
set completeopt=menuone,noselect,noinsert
" Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('max_list', 15)
" ALE
" let g:ale_completion_enabled = 1
" let g:ale_completion_max_suggestions=10
" NCM2
" autocmd BufEnter * call ncm2#enable_for_buffer()

"""""""""""""
" => Denite "
"""""""""""""
nnoremap <silent> <C-p> :<C-u>Denite file/rec<CR>
nnoremap <silent> <leader>/ :<C-u>Denite grep:. -mode=normal<CR>
nnoremap <silent> <leader><space>/ :<C-u>DeniteBufferDir grep:. -mode=normal<CR>
nnoremap <silent> <leader>fw :<C-u>DeniteCursorWord grep:. -mode=normal -highlight-matched-char=None<CR>

if executable('ag')
  " Grep
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'pattern_opt', [])

  " File/rec
  call denite#custom#var('file/rec', 'command',
    \ ['ag' , '--hidden', '--follow', '--vimgrep', '-S', '-g', ''])
endif

""""""""""""""""
" => SuperTab
""""""""""""""""
let g:SuperTabDefaultCompletionType = "<tab>"

""""""""""""""""
" => UltiSnips "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => NeoYank
""""""""""""""""""""""""""""""
if has("clipboard")
  try
    let g:neoyank#file = $HOME.'/.nvim/temp_dir/neoyank.txt'
  catch
  endtry
endif

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinSize=30
let g:NERDTreeWinPos="right"
let g:NERDTreeIgnore=["\.pyc$", "venv", "__pycache__"]

" Auto close NERDTree when the only open window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""
" => Airline
""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" let g:airline_powerline_fonts=1
let g:airline_extensions = ['tabline', 'branch', 'ale']
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

""""""""""""""""""""
" => NERDCommenter
""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"""""""""""
" => ALE  "
"""""""""""
" Linting and auto-formatting code
let g:ale_pattern_options = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ '\.py$': {
\  'ale_linters': ['flake8', 'pyls'],
\  'ale_fixers': ['black', 'isort', 'add_blank_lines_for_python_control_statements']
\ },
\}

let g:ale_linters_ignore = ['pyls'] " Prevent overlapping flake8
let g:ale_python_flake8_options = "--max-line-length=120"
" let g:ale_fix_on_save = 1

" Action mapping
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>

" Navigation
nmap <silent> <leader>n <Plug>(ale_next_wrap)
nmap <silent> <leader>p <Plug>(ale_previous_wrap)
nmap <silent> <leader>fi <Plug>(ale_fix)
