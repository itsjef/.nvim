""""""""""""
" vim-plug "
""""""""""""
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  execute '!curl https://raw.github.com/junegunn/vim-plug/master/plug.vim -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs'
endif

call plug#begin('~/.nvim/bundle')
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'

" Autocompletion and snippets
Plug 'mattn/emmet-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'zchee/deoplete-jedi',      { 'for': 'python' }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'vue'], 'do': 'npm install -g tern' }

" Shougo
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/vimproc.vim',   { 'do': 'make' }

" Denite
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neomru.vim'
Plug 'Shougo/neoyank.vim'
Plug 'tsukkee/unite-tag'

" HTML & CSS & Javascript
Plug 'elzr/vim-json'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'mxw/vim-jsx'

" Vue
Plug 'posva/vim-vue'

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
                \ 'html',
                \ 'vue',
                \ ]

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
let g:NERDTreeIgnore=["\.pyc$"]

" Auto close NERDTree when the only open window left is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

""""""""""""""""
" => Airline
""""""""""""""""
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" let g:airline_powerline_fonts=1
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

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
