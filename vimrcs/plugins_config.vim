""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.nvim/bundle')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
" Plug 'digitaltoad/vim-pug'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/YankRing.vim'
Plug 'Raimondi/delimitMate'
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'godlygeek/tabular'

" Haskell
"Plug 'neovimhaskell/haskell-vim'
"Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }

" Colorscheme & Display helper
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json',   { 'for': ['html', 'json'] }
Plug 'othree/yajs.vim', { 'for': ['html', 'json', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',     { 'for': ['html', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['html', 'javascript.jsx'] }

" Autocompletion and snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi',      { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript.jsx', 'do': 'npm install -g tern' }

" Shougo
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim',   { 'do': 'make' }
Plug 'Shougo/unite.vim'

" Unite Plugins
Plug 'Shougo/neomru.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'ujihisa/unite-colorscheme'

" Ruby & Rails
Plug 'tpope/vim-rails',   { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

au BufRead,BufNewFile *.vue set ft=html

""""""""""""""
" => Tabular "
""""""""""""""
nmap <leader><Tab>=  :Tabularize /=<CR>
vmap <leader><Tab>=  :Tabularize /=<CR>
nmap <leader><Tab>:  :Tabularize /:\zs<CR>
vmap <leader><Tab>:  :Tabularize /:\zs<CR>
nmap <leader><Tab>,  :Tabularize /,<CR>
vmap <leader><Tab>,  :Tabularize /,<CR>
nmap <leader><Tab>=> :Tabularize /=><CR>
vmap <leader><Tab>=> :Tabularize /=><CR>

""""""""""""""""
" => SuperTab
""""""""""""""""
let g:SuperTabDefaultCompletionType = "<tab>"

"""""""""""""""""""""""""""""
" => Unite
"""""""""""""""""""""""""""""
call unite#custom#profile('default', 'context', {
  \ 'winheight': 10,
  \ 'direction': 'dynamicbottom',
  \ 'prompt': '» '
  \ })

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

" Tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'

""""""""""""""""
" => NeoMake   "
""""""""""""""""
autocmd! BufWritePost * Neomake
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:neomake_jsx_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_ruby_enabled_makers = ['reek', 'mri']
let g:neomake_jsx_enabled_makers  = ['eslint']

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
" autocmd VimEnter * NERDTree
" autocmd BufWinEnter * NERDTreeMirror
" autocmd VimEnter * wincmd p " go back to editor tab

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
let g:airline_extensions = ['branch', 'tabline', 'whitespace', 'neomake', 'unite']
let g:airline#extensions#tabline#fnamemod = ':t'" Just show the filename (no path) in the tab

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
