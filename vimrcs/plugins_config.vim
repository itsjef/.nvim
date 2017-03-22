""""""""""""
" vim-plug "
""""""""""""
if empty(glob("~/.nvim/autoload/plug.vim"))
  execute '!curl https://raw.github.com/junegunn/vim-plug/master/plug.vim -fLo ~/.nvim/autoload/plug.vim --create-dirs'
endif

call plug#begin('~/.nvim/bundle')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim' " replacing vim-airline
Plug 'ap/vim-buftabline' " replacing vim-airline
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'

" Autocompletion and snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi',      { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript', 'do': 'npm install -g tern' }

" Shougo
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim',   { 'do': 'make' }

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/unite.vim' " Obsolete, replaced by denite.nvim
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'tsukkee/unite-tag'

" Ruby & Rails
"Plug 'tpope/vim-rails',   {'for': 'ruby'}
"Plug 'tpope/vim-bundler', {'for': 'ruby'}
"Plug 'tpope/vim-endwise', {'for': 'ruby'}
"Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
"Plug 'slim-template/vim-slim'

" TypeScript
"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/deoplete-typescript', { 'do': ':UpdateRemotePlugins' }

" HTML & CSS & Javascript
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'othree/javascript-libraries-syntax.vim'
"Plug 'othree/jspc.vim'

" Haskell
"Plug 'eagletmt/neco-ghc', { 'for': 'haskell', 'do': 'cabal install ghc-mod' }
"Plug 'neovimhaskell/haskell-vim'

call plug#end()

""""""""""""""""
" => EasyAlign "
""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

""""""""""""""""
" => SuperTab
""""""""""""""""
let g:SuperTabDefaultCompletionType = "<tab>"

"""""""""""""""""""""""""""""
" => Denite
"""""""""""""""""""""""""""""
call denite#custom#option('default', 'prompt', '»')
call denite#custom#option('default', 'reversed', 'true')
call denite#custom#option('default', 'winheight', 10)

call denite#custom#source('file_mru', 'matchers', ['matcher_project_files'])

nmap <leader>f :Denite file_mru<CR>
nmap <leader>b :Denite -mode=normal buffer<CR>
nmap <F10> :Denite outline<CR>

"""""""""""""""
" => Deoplete "
"""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" No need for previewing
set completeopt-=preview

" Tern
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = '0'
let g:tern#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ ]

" Haskell
" let g:haskellmode_completion_ghc = 0
" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
""""""""""""""""
" => NeoMake   "
""""""""""""""""
autocmd! BufWritePost * Neomake
let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
let b:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_python_flake8_maker = {
  \ 'args': ['--ignore=E221,E402,E501,E126'],
  \ }
"let g:neomake_ruby_enabled_makers       = ['reek', 'mri']
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers    = ['flake8']

""""""""""""""""
" => UltiSnips "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => NeoYank
""""""""""""""""""""""""""""""
if has("win32") || has("win64")
    " Do nothing
else
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
let g:NERDTreeIgnore=["\.pyc$"]

" Set NERDTree on by default
" autocmd VimEnter * NERDTree
" autocmd BufWinEnter * NERDTreeMirror
" autocmd VimEnter * wincmd p " go back to editor tab

" Auto close NERDTree when the only open window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""
" => Lightline "
""""""""""""""""
let g:lightline = {
\ 'colorscheme': 'onedark',
\ }

" => Airline
""""""""""""""""""""""""""""""
"if (exists('g:loaded_airline_themes') && g:loaded_airline_themes)
"  finish
"endif
"let g:loaded_airline_themes = 1
"
"" Avoid accidentally overwritting existing symbols
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"
"let g:airline_powerline_fonts=1
"let g:airline_extensions = ['branch', 'tabline', 'whitespace', 'neomake']
"let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename (no path) in the tab

"""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""
" No mapping at all
let g:gitgutter_map_keys = 0

""""""""""""""""""""
" => IndentGuide
""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['json', 'nerdtree']

""""""""""""""""""""
" => NERDCommenter
""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"""""""""""""
" => PyMode "
"""""""""""""
" let g:pymode_run = 0
" let g:pymode_folding = 0
" let g:pymode_lint_cwindow = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_lint_ignore = 'E731,E221'
nmap <leader>r = :!python2 %<CR>
