""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.nvim/bundle')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/YankRing.vim'
Plug 'Raimondi/delimitMate'

" Haskell
"Plug 'neovimhaskell/haskell-vim'
"Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" Colorscheme & Display helper
Plug 'chriskempson/base16-vim'

Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'othree/yajs.vim', { 'for': ['json', 'javascript', 'jsx'] }

" Autocompletion and snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
"Plug 'zchee/deoplete-jedi', { 'for': 'python' }

" Shougo
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'

" Unite Plugins
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'

" Ruby & Rails
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

" Vue
"Plug 'posva/vim-vue'

" Angular2 & Typescript
"Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
"Plug 'Quramy/tsuquyomi'          , { 'for': 'typescript' }

call plug#end()

"""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""
call unite#custom#profile('default', 'context', {
  \ 'winheight': 10,
  \ 'direction': 'dynamicbottom',
  \ 'prompt': '» '
  \ })

"autocmd FileType unite setlocal number relativenumber
"autocmd BufWinEnter,BufEnter * setlocal number relativenumber

nmap <leader>f :Unite -start-insert neomru/file<CR>
nmap <F10> :Unite -vertical -winwidth=30 -toggle outline<CR>

""""""""""""""""
" => Deoplete  "
""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" In order for deoplete-clang to work
"let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so.1'
"let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang'
"let g:clang_library_path='/usr/lib/llvm-3.5/lib/libclang.so.1'

" No need for previewing
set completeopt-=preview

""""""""""""""""
" => NeoMake   "
""""""""""""""""
autocmd! BufWritePost * Neomake

let g:neomake_ruby_enabled_makers = ['reek', 'mri']
let g:neomake_javascript_enabled_makers = ['jshint']

""""""""""""""""
" => UltiSnips "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win32") || has("win64")
    " Do nothing
else
  try
    let g:yankring_history_dir = '$HOME/.nvim/temp_dir'
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

" Set NERDTree on by default
"autocmd VimEnter * NERDTree
"autocmd BufWinEnter * NERDTreeMirror
"autocmd VimEnter * wincmd p " go back to editor tab

" Auto close NERDTree when the only open window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
if (exists('g:loaded_airline_themes') && g:loaded_airline_themes)
  finish
endif
let g:loaded_airline_themes = 1

" Avoid accidentally overwritting existing symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_powerline_fonts=1
let g:airline_extensions = ['branch', 'tabline', 'neomake', 'unite']
let g:airline#extensions#tabline#fnamemod = ':t'

"""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""
" No mapping at all
let g:gitgutter_map_keys = 0

""""""""""""""""""""
" => IndentLine
""""""""""""""""""""
" for vim-json to work
let g:indentLine_concealcursor = ''
let g:indentLine_char = '¦'
