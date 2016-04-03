""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.nvim/bundle')
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'Raimondi/delimitMate'
Plug 'Shougo/deoplete.nvim'
Plug 'SirVer/ultisnips'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/syntastic'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes' | Plug 'vim-airline/vim-airline'
Plug 'vim-scripts/YankRing.vim'
Plug 'vim-scripts/mru.vim'
Plug 'vim-scripts/taglist.vim'

Plug 'zchee/deoplete-clang', { 'for': ['c', 'cpp'] }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
call plug#end()

""""""""""""""""
" => Deoplete  "
""""""""""""""""
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1

" In order for deoplete-clang to work
let g:deoplete#sources#clang#libclang_path='/usr/lib/llvm-3.8/lib/libclang.so'
let g:deoplete#sources#clang#clang_header='/usr/lib/llvm-3.8/lib/clang'

" No need for previewing
set completeopt-=preview
""""""""""""""""
" => UtilSnips "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

""""""""""""""""""""""""""""""
" => MRU
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 100
map <leader>f :MRU<cr>

""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win32") || has("win64")
    " Do nothing
else
  try
    let g:yankring_history_dir = '~/.nvim/temp_dir'
  catch
  endtry
endif

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>
let g:NERDTreeWinSize=25
let g:NERDTreeWinPos="right"

" Set NERDTree on by default
autocmd VimEnter * NERDTree
autocmd BufWinEnter * NERDTreeMirror
autocmd VimEnter * wincmd p " go back to editor tab

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
let g:airline_extensions = ['tabline']
let g:airline#extensions#tabline#fnamemod = ':t' 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimroom - Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=100
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>

""""""""""""""""""""""""""""
" => CtrlP
""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-f>' " Avoid conflict with YankRing <c-p>
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|^\.DS_Store\|^\.git\|^\.coffee'

"""""""""""""""""""""""
" => Markdown
"""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

"""""""""""""""""""""""
" => GitGutter
"""""""""""""""""""""""
" No mapping at all
let g:gitgutter_map_keys = 0
