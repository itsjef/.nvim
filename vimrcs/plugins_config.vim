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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorscheme & Display helper
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot', {'do': './build'}

" Shougo
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Autocompletion and snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
call plug#end()

""""""""""""""""
" => SuperTab
""""""""""""""""
let g:SuperTabDefaultCompletionType = "<tab>"

"""""""""""""""
" => Deoplete "
"""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" No need for previewing
set completeopt-=preview

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
let g:airline_extensions = ['tabline', 'branch']
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
let g:ale_pattern_options = {
\ '\.py$': {'ale_linters': ['flake8'], 'ale_fixers': []},
\}


""""""""""
" => FZF "
""""""""""
nnoremap <leader>ff :FZF<cr>
