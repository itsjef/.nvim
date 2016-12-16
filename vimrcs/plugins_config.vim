""""""""""""
" vim-plug "
""""""""""""
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
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'mhartington/oceanic-next'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'

" Autocompletion and snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi',      { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'for': 'javascript', 'do': 'npm install -g tern' }
Plug 'Quramy/tsuquyomi',         { 'for': 'typescript', 'do': 'npm isntall -g typescript' }

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

" Ruby & Rails
"Plug 'tpope/vim-rails',   {'for': 'ruby'}
"Plug 'tpope/vim-bundler', {'for': 'ruby'}
"Plug 'tpope/vim-endwise', {'for': 'ruby'}
"Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
"Plug 'slim-template/vim-slim'

" HTML & CSS & Javascript
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'othree/jspc.vim'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'hail2u/vim-css3-syntax'

" TypeScript
Plug 'HerringtonDarkholme/yats.vim'

" Python
Plug 'klen/python-mode', { 'for': 'python' }

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
let b:neomake_javascript_eslint_exe = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')

let g:neomake_ruby_enabled_makers = ['reek', 'mri']
let g:neomake_javascript_enabled_makers  = ['eslint']

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
let g:airline#extensions#tabline#fnamemod = ':t' " Just show the filename (no path) in the tab

"""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""
" No mapping at all
let g:gitgutter_map_keys = 0

""""""""""""""""""""
" => IndentGuide
""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['json']

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
let g:pymode_folding = 0
let g:pymode_run = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_lint_ignore = 'E731'
nmap <leader>r = :!python2 %<CR>
