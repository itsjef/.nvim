"""""""""""""""""""""""""""
" => Load pathogen paths  "
"""""""""""""""""""""""""""
execute pathogen#infect('~/.nvim_runtime/bundle/{}')

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

""""""""""""""""""""""""""""""
" => Airline
""""""""""""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme="gruvbox"
