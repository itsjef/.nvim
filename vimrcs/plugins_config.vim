"""""""""""""""""""""""""""
" => Load pathogen paths  "
"""""""""""""""""""""""""""
execute pathogen#infect('~/.nvim_runtime/bundle/{}')

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
        let g:yankring_history_dir = '~/.nvim_runtime/temp_dir'
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

" Auto close NERDTree when 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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
let g:airline_extensions = ['tabline', 'branch']
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
